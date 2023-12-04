import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/domain/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
Future<AppColorScheme> profileColorScheme(ProfileColorSchemeRef ref) async {
  final backgroundUrl = ref
      .watch(userProvider.select((value) => value.requireValue!.backgroundUrl));
  const colorScheme = AppColorScheme();

  if (backgroundUrl == null) {
    return colorScheme;
  }

  final newProfileScheme = await colorScheme.getColors(imgUrl: backgroundUrl);

  return newProfileScheme;
}
