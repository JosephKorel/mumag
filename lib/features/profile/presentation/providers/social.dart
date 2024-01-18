import 'dart:convert';

import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/providers/local_data.dart';
import 'package:mumag/common/services/social_relations/providers/social.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'social.g.dart';

@riverpod
FutureOr<void> mySocialRelations(
  MySocialRelationsRef ref,
) async {
  final socialUsecase = ref.watch(socialRelationsUsecaseProvider);
  final user = ref.watch(userProvider).requireValue!;
  final request = await socialUsecase
      .getSocialRelations(
        socialRelationsParams: GetSocialRelationsEvent(currentUserId: user.id),
      )
      .run();

  request.fold(
      (l) => ref.read(toastMessageProvider.notifier).onException(exception: l),
      (r) async {
    await ref
        .read(localDataProvider)
        .setString(key: socialRelationsKey, value: jsonEncode(r.toJson()))
        .run();

    ref.invalidate(userRelationsProvider);
  });
}
