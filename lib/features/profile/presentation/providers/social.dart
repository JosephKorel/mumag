import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/providers/social.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'social.g.dart';

@riverpod
FutureOr<Either<AppException, UserSocialRelations>> mySocialRelations(
  MySocialRelationsRef ref,
) async {
  final socialUsecase = ref.watch(socialRelationsUsecaseProvider);
  final user = ref.watch(userProvider).requireValue!;
  final request = await socialUsecase
      .getSocialRelations(
        socialRelationsParams: GetSocialRelationsEvent(currentUserId: user.id),
      )
      .run();

  return request;
}
