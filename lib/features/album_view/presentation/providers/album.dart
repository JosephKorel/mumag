import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/features/profile/domain/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'album.g.dart';

@riverpod
class ViewingAlbum extends _$ViewingAlbum {
  @override
  Future<Album?> build() async => null;

  Future<void> updateState({required String albumId}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final album = await ref.read(spotifyApiProvider).albums.get(albumId);

      return album;
    });
  }
}

@riverpod
Future<AppColorScheme> albumColorScheme(AlbumColorSchemeRef ref) async {
  final album = ref.watch(viewingAlbumProvider).requireValue!;

  final images = album.images;

  const colorScheme = AppColorScheme();

  if (images == null) {
    return colorScheme;
  }

  final albumColors = await colorScheme.getColors(imgUrl: images[0].url!);

  return albumColors;
}

@riverpod
Future<List<RatingEntity>?> albumRating(
  AlbumRatingRef ref,
) async {
  final album = ref.watch(viewingAlbumProvider).requireValue!;
  final ratingController = ref.watch(ratingControllerProvider);

  final albumRating =
      await ratingController(event: GetAllRatingParams(spotifyId: album.id!))
          .run();

  return albumRating.fold(
    (l) => null,
    (r) => r as List<RatingEntity>,
  );
}

@riverpod
Future<List<String>> albumGenres(AlbumGenresRef ref) async {
  final album = ref.watch(viewingAlbumProvider).requireValue!;
  final spotify = ref.watch(spotifyApiProvider);
  final request = await spotify.albums.get(album.id!);

  if (request.genres != null && request.genres!.isNotEmpty) {
    return request.genres!;
  }

  return album.genres ?? [];

  /*  final artistRequest = await spotify.artists
      .list(album.artists?.map((e) => e.id).toList() ?? []);

  return artistRequest
      .map((e) => e.genres ?? [])
      .expand((element) => element)
      .toList(); */
}

@riverpod
class ViewingRating extends _$ViewingRating {
  @override
  bool build() {
    return false;
  }

  void updateState({required bool viewingRating}) => state = viewingRating;
}
