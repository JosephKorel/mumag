import 'dart:convert';

import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/providers/suggestion.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'suggestions.g.dart';

const suggestionsKey = 'suggestions';

@riverpod
FutureOr<void> fetchUserSuggestions(FetchUserSuggestionsRef ref) async {
  final user = ref.watch(localUserProvider)!;
  final data = await ref
      .read(suggestionControllerProvider)(
        event: GetUserSuggestionParams(userId: user.id),
      )
      .run();
  await data.fold((l) => null, (r) async {
    final data = r as List<SuggestionEntity>;
    await ref
        .read(localDataProvider)
        .setString(
          key: suggestionsKey,
          value: jsonEncode(data.map((e) => e.toJson()).toList()),
        )
        .run();

    ref.invalidate(userSuggestionsProvider);
  });
}

@riverpod
List<SuggestionEntity> userSuggestions(UserSuggestionsRef ref) {
  final localData = ref.watch(localDataProvider);
  final data = localData.getString<List<dynamic>>(key: suggestionsKey);

  if (data == null) {
    return [];
  }

  return data
      .map(
        (e) => SuggestionEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList();
}
