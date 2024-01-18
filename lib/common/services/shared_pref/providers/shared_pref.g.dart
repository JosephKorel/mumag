// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_pref.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'5bd64b2e955a2adbe9af0a4cd3edab6923105998';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider =
    AutoDisposeProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = AutoDisposeProviderRef<SharedPreferences>;
String _$credentialsImplementationHash() =>
    r'927409b8804ead84367d9f75986d7e26da2acc91';

/// See also [credentialsImplementation].
@ProviderFor(credentialsImplementation)
final credentialsImplementationProvider =
    AutoDisposeProvider<SpotifyApiCredentialsRepository>.internal(
  credentialsImplementation,
  name: r'credentialsImplementationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$credentialsImplementationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CredentialsImplementationRef
    = AutoDisposeProviderRef<SpotifyApiCredentialsRepository>;
String _$localDataHash() => r'06665254ef11992ba361c018dd4515e3b682b6dd';

/// See also [localData].
@ProviderFor(localData)
final localDataProvider = AutoDisposeProvider<LocalStorageUsecase>.internal(
  localData,
  name: r'localDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalDataRef = AutoDisposeProviderRef<LocalStorageUsecase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
