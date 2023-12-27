import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/domain/relations_repository.dart';

final class SocialRelationsUsecase {
  SocialRelationsUsecase(this._socialRelationsRepository);

  final SocialRelationsRepository _socialRelationsRepository;

  ApiResult<void> followUser({required FollowUserEvent followParams}) =>
      TaskEither.tryCatch(
        () {
          return _socialRelationsRepository.followUser(
            followParams: followParams,
          );
        },
        (error, stackTrace) => ApiException(errorMsg: ''),
      );

  ApiResult<UserSocialRelations> getSocialRelations({
    required GetSocialRelationsEvent socialRelationsParams,
  }) =>
      TaskEither.tryCatch(
        () async {
          final relations = await _socialRelationsRepository.getSocialRelations(
            socialRelationParams: socialRelationsParams,
          );

          return relations;
        },
        (error, stackTrace) => ApiException(errorMsg: ''),
      );

  ApiResult<void> unfollowUser({
    required UnfollowUserEvent unfollowParams,
  }) =>
      TaskEither.tryCatch(
        () {
          return _socialRelationsRepository.unfollowUser(
            unfollowParams: unfollowParams,
          );
        },
        (error, stackTrace) => ApiException(errorMsg: ''),
      );
}

final class SocialRelationsController {
  SocialRelationsController(this._socialRelationsUsecase);

  final SocialRelationsUsecase _socialRelationsUsecase;

  ApiResult<dynamic> call(SocialRelationsEvents event) => switch (event) {
        FollowUserEvent() =>
          _socialRelationsUsecase.followUser(followParams: event),
        GetSocialRelationsEvent() => _socialRelationsUsecase.getSocialRelations(
            socialRelationsParams: event,
          ),
        UnfollowUserEvent() =>
          _socialRelationsUsecase.unfollowUser(unfollowParams: event)
      };
}
