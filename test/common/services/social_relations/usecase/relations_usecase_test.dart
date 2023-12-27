import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/domain/relations_repository.dart';
import 'package:mumag/common/services/social_relations/usecase/relations_usecase.dart';

class SocialRelationsRepoMock extends Mock
    implements SocialRelationsRepository {}

void main() {
  const followUserParams = FollowUserEvent(
    currentUserId: 0,
    followingUserId: 1,
  );
  const getSocialRelationsParams = GetSocialRelationsEvent(currentUserId: 0);
  const unfollowUserParams = UnfollowUserEvent(
    currentUserId: 0,
    followingUserId: 1,
  );

  final socialRelationsRepoMock = SocialRelationsRepoMock();
  final socialRelationsUsecase =
      SocialRelationsUsecase(socialRelationsRepoMock);

  group('Tests for Social Relations Usecase', () {
    test('Follow user and return void', () async {
      // arrange
      when(
        () => socialRelationsRepoMock.followUser(
          followParams: followUserParams,
        ),
      ).thenAnswer((invocation) async {});

      // prepare
      final result = await socialRelationsUsecase
          .followUser(followParams: followUserParams)
          .run();

      // assert
      expect(result.isRight(), true);
    });

    test('Follow user throws exception and usecase return Left type', () async {
      // arrange
      when(
        () => socialRelationsRepoMock.followUser(
          followParams: followUserParams,
        ),
      ).thenAnswer((invocation) async => throw Error());

      // prepare
      final result = await socialRelationsUsecase
          .followUser(followParams: followUserParams)
          .run();

      // assert
      expect(result, isA<Left<AppException, void>>());
      expect(result.fold((l) => l, (r) => null), isA<FollowUserException>());
    });

    test('Retrieve user followers and following', () async {
      // arrange
      when(
        () => socialRelationsRepoMock.getSocialRelations(
          socialRelationParams: getSocialRelationsParams,
        ),
      ).thenAnswer(
        (invocation) async => UserSocialRelations(
          following: [],
          followers: [],
        ),
      );

      // prepare
      final result = await socialRelationsUsecase
          .getSocialRelations(socialRelationsParams: getSocialRelationsParams)
          .run();

      // assert
      expect(result.isRight(), true);
      expect(result.fold((l) => l, (r) => r), isA<UserSocialRelations>());
    });

    test('Retrieve user followers and following throws error', () async {
      // arrange
      when(
        () => socialRelationsRepoMock.getSocialRelations(
          socialRelationParams: getSocialRelationsParams,
        ),
      ).thenAnswer(
        (invocation) async => throw Error(),
      );

      // prepare
      final result = await socialRelationsUsecase
          .getSocialRelations(socialRelationsParams: getSocialRelationsParams)
          .run();

      // assert
      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (r) => r),
        isA<GetSocialRelationsException>(),
      );
    });

    test('Unfollow user and return void', () async {
      // arrange
      when(
        () => socialRelationsRepoMock.unfollowUser(
          unfollowParams: unfollowUserParams,
        ),
      ).thenAnswer((invocation) async {});

      // prepare
      final result = await socialRelationsUsecase
          .unfollowUser(unfollowParams: unfollowUserParams)
          .run();

      // assert
      expect(result.isRight(), true);
    });

    test('Unfollow user throws exception and usecase return Left type',
        () async {
      // arrange
      when(
        () => socialRelationsRepoMock.unfollowUser(
          unfollowParams: unfollowUserParams,
        ),
      ).thenAnswer((invocation) async => throw Error());

      // prepare
      final result = await socialRelationsUsecase
          .unfollowUser(unfollowParams: unfollowUserParams)
          .run();

      // assert
      expect(result, isA<Left<AppException, void>>());
      expect(result.fold((l) => l, (r) => null), isA<UnfollowException>());
    });
  });
}
