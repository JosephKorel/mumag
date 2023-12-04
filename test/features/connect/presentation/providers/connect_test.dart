import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_repo.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/data/auth.dart';
import 'package:mumag/common/services/spotify_auth/domain/auth_repository.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/connect/domain/insert_params_repo.dart';
import 'package:mumag/features/connect/domain/save_user_controller.dart';
import 'package:mumag/features/connect/domain/save_user_repo.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';
import 'package:spotify/spotify.dart';

class SpotifyAuthRepositoryMock extends Mock implements SpotifyAuthRepository {}

class UserApiMock extends Mock implements UserApiUsecaseRepository {}

class ControllerRepositoryMock extends Mock implements ControllerRepository {}

class InsertParamsRepositoryMock extends Mock
    implements InsertParamsRepository {}

class SpotifyApiCredentialsRepositoryMock extends Mock
    implements SpotifyApiCredentialsRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}

void main() {
  // User api use case repository
  final userApi = UserApiMock();

  // Insert params repository
  final insertParamsRepo = InsertParamsRepositoryMock();

  // Handles saving credentials in local storage
  final spotifyApiCredentialsRepo = SpotifyApiCredentialsRepositoryMock();

  // Handles fetching params and inserting user
  final insertUserController = InsertUserController(insertParamsRepo, userApi);

  final saveUserImpl = SpotifyAuthRepositoryMock();
  final spotifyAuthController = SpotifyAuthController(saveUserImpl);
  final spotifyCredentials = SpotifyApiCredentials(
    '',
    '',
    accessToken: '',
    refreshToken: '',
  );
  final insertParams = InsertParams(
    email: '',
    name: '',
    genres: '',
    avatarUrl: '',
    backgroundUrl: '',
  );
  final userEntity = UserEntity(
    id: 1,
    name: insertParams.name,
    email: insertParams.email,
    genres: [],
    avatarUrl: null,
    lastUpdatedAt: DateTime.now(),
  );

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<void>());
  });
  group('Tests for spotify connection provider', () {
    test('Should initiate with AsyncValue<void>()', () {
      // arrange
      final listener = Listener<AsyncValue<void>>();

      createContainer(
        overrides: [
          spotifyAuthProvider.overrideWith((ref) => saveUserImpl),
        ],
      ).listen(handleConnectionProvider, listener.call, fireImmediately: true);

      // assert
      verify(
        () => listener(null, const AsyncData<void>(null)),
      );

      verifyNoMoreInteractions(listener);

      verifyNever(saveUserImpl.authenticate);
    });

    test('Case user does not grant permission', () async {
      const data = AsyncData<void>(null);

      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          spotifyAuthControllerProvider
              .overrideWith((ref) => spotifyAuthController),
        ],
      )..listen(handleConnectionProvider, listener.call, fireImmediately: true);

      verify(
        () => listener(null, data),
      );

      when(
        saveUserImpl.authenticate,
      ).thenThrow(Exception());

      final controller = container.read(handleConnectionProvider.notifier);

      await controller.connect();

      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading<void>>())),
        () => listener(any(that: isA<AsyncLoading<void>>()), data),
      ]);

      verify(saveUserImpl.authenticate).called(1);

      verifyNoMoreInteractions(listener);
    });

    test('User grants permission, but fails to save it in local storage',
        () async {
      const data = AsyncData<void>(null);

      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          credentialsImplementationProvider
              .overrideWith((ref) => spotifyApiCredentialsRepo),
          spotifyAuthControllerProvider
              .overrideWith((ref) => spotifyAuthController),
        ],
      )..listen(handleConnectionProvider, listener.call, fireImmediately: true);

      verify(
        () => listener(null, data),
      );

      // Get credentials
      when(
        saveUserImpl.authenticate,
      ).thenAnswer((invocation) async => spotifyCredentials);

      // Saves in local storage
      when(
        () => spotifyApiCredentialsRepo.saveCredentials(
          credentials: spotifyCredentials,
        ),
      ).thenAnswer((invocation) async => false);

      final controller = container.read(handleConnectionProvider.notifier);

      await controller.connect();

      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading<void>>())),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              any(that: isA<AsyncError<void>>()),
            ),
      ]);

      verify(saveUserImpl.authenticate).called(1);

      verifyNoMoreInteractions(listener);
    });

    test(
        'User grants permission, saves in storage but fails to get params to insert user',
        () async {
      const data = AsyncData<void>(null);

      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          credentialsImplementationProvider
              .overrideWith((ref) => spotifyApiCredentialsRepo),
          spotifyAuthControllerProvider
              .overrideWith((ref) => spotifyAuthController),
        ],
      )..listen(handleConnectionProvider, listener.call, fireImmediately: true);

      verify(
        () => listener(null, data),
      );

      // Get credentials
      when(
        saveUserImpl.authenticate,
      ).thenAnswer((invocation) async => spotifyCredentials);

      // Saves in local storage
      when(
        () => spotifyApiCredentialsRepo.saveCredentials(
          credentials: spotifyCredentials,
        ),
      ).thenAnswer((invocation) async => true);

      // Get params to insert user
      when(
        () => insertParamsRepo.getUserParams(email: ''),
      ).thenThrow(Exception());

      final controller = container.read(handleConnectionProvider.notifier);

      await controller.connect();

      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading<void>>())),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              any(that: isA<AsyncError<void>>()),
            ),
      ]);

      verify(saveUserImpl.authenticate).called(1);

      verifyNoMoreInteractions(listener);
    });

    test(
        'User grants permission, saves in storage, get params to insert user but fails to save in database',
        () async {
      const data = AsyncData<void>(null);

      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          credentialsImplementationProvider
              .overrideWith((ref) => spotifyApiCredentialsRepo),
          spotifyAuthControllerProvider
              .overrideWith((ref) => spotifyAuthController),
        ],
      )..listen(handleConnectionProvider, listener.call, fireImmediately: true);

      verify(
        () => listener(null, data),
      );

      // Get credentials
      when(
        saveUserImpl.authenticate,
      ).thenAnswer((invocation) async => spotifyCredentials);

      // Saves in local storage
      when(
        () => spotifyApiCredentialsRepo.saveCredentials(
          credentials: spotifyCredentials,
        ),
      ).thenAnswer((invocation) async => true);

      // Get params to insert user
      when(
        () => insertParamsRepo.getUserParams(email: ''),
      ).thenAnswer((invocation) async => insertParams);

      // Get params to insert user
      when(
        () => userApi.insertUser(insertParams: insertParams),
      ).thenThrow(Exception());

      final controller = container.read(handleConnectionProvider.notifier);

      await controller.connect();

      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading<void>>())),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              any(that: isA<AsyncError<void>>()),
            ),
      ]);

      verify(saveUserImpl.authenticate).called(1);

      verifyNoMoreInteractions(listener);
    });

    test(
        'User grants permission, saves in storage, get params to insert user and insert it',
        () async {
      const data = AsyncData<void>(null);

      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          credentialsImplementationProvider
              .overrideWith((ref) => spotifyApiCredentialsRepo),
          createUserProvider
              .overrideWith((ref) => insertUserController.newUser(email: '')),
          spotifyAuthControllerProvider
              .overrideWith((ref) => spotifyAuthController),
        ],
      )..listen(handleConnectionProvider, listener.call, fireImmediately: true);

      verify(
        () => listener(null, data),
      );

      // Get credentials
      when(
        saveUserImpl.authenticate,
      ).thenAnswer((invocation) async => spotifyCredentials);

      // Saves in local storage
      when(
        () => spotifyApiCredentialsRepo.saveCredentials(
          credentials: spotifyCredentials,
        ),
      ).thenAnswer((invocation) async => true);

      // Get params to insert user
      when(
        () => insertParamsRepo.getUserParams(email: ''),
      ).thenAnswer((invocation) async => insertParams);

      // Get params to insert user
      when(
        () => userApi.insertUser(insertParams: insertParams),
      ).thenAnswer((invocation) async => userEntity);

      final controller = container.read(handleConnectionProvider.notifier);

      await controller.connect();

      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading<void>>())),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              data,
            ),
      ]);

      verify(saveUserImpl.authenticate).called(1);

      verifyNoMoreInteractions(listener);
    });
  });
}
