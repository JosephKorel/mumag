import 'package:mumag/features/profile/domain/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'album.g.dart';

@riverpod
class ViewingAlbum extends _$ViewingAlbum {
  @override
  AlbumSimple? build() => null;

  void updateState({required AlbumSimple album}) => state = album;
}

@riverpod
Future<AppColorScheme> albumColorScheme(AlbumColorSchemeRef ref) async {
  final album = ref.watch(viewingAlbumProvider)!;

  final images = album.images;

  const colorScheme = AppColorScheme();

  if (images == null) {
    return colorScheme;
  }

  final albumColors = await colorScheme.getColors(imgUrl: images[1].url!);

  return albumColors;
}
