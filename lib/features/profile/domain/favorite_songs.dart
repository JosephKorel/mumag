import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/media/album.dart';
import 'package:mumag/common/models/media/artist.dart';
import 'package:mumag/common/models/media/track.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/shared_pref/usecase/local_data.dart';
import 'package:mumag/features/profile/data/favorite_songs.dart';
import 'package:spotify/spotify.dart';

final class FavoriteSongsLocal {
  const FavoriteSongsLocal({
    required this.spotify,
    required this.localStorageUsecase,
  });

  final SpotifyApi spotify;
  final LocalStorageUsecase localStorageUsecase;

  static const _limit = 10;
  static const _songsKey = 'savedSongs';

  Future<List<SavedTrack>> getFavoriteSongs(int offset) async {
    try {
      final request = await spotify.tracks.me.saved.getPage(_limit, offset);
      if (request.items == null) {
        return [];
      }

      return request.items!
          .map(
            (e) => SavedTrack(
              id: 2,
              name: e.track?.name ?? '',
              album: SimpleAlbum(
                name: e.track!.album?.name ?? '',
                spotifyId: e.track?.album?.id ?? '',
              ),
              artist: e.track?.artists != null
                  ? e.track!.artists!
                      .map(
                        (e) => ArtistEntity(
                          name: e.name ?? '',
                          spotifyId: e.id ?? '',
                        ),
                      )
                      .toList()
                  : [],
              spotifyId: e.track?.id ?? '',
              imageUrl: e.track?.album?.images?[2].url ?? '',
              addedAt: e.addedAt ?? DateTime.now(),
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  bool shouldSendToDb({
    required List<SavedTrack> newTracks,
  }) {
    final currentTracks = getTracksFromStorage();

    final summedList = Set<SavedTrack>.from(
      (currentTracks..addAll(newTracks))
        ..sort(
          (a, b) => b.addedAt.compareTo(
            a.addedAt,
          ),
        ),
    );

    return summedList.length == currentTracks.length;
  }

  List<SavedTrack> updateCurrentSavedTracks({
    required List<SavedTrack> currentTracks,
    required List<SavedTrack> newTracks,
  }) {
    final summedList = Set<SavedTrack>.from(
      (currentTracks..addAll(newTracks))
        ..sort(
          (a, b) => b.addedAt.compareTo(
            a.addedAt,
          ),
        ),
    );

    return summedList.toList();
  }

  void saveTracksInStorage({
    required List<SavedTrack> newTracks,
  }) {
    final currentTracks = getTracksFromStorage()..addAll(newTracks);

    localStorageUsecase.setString(
      key: _songsKey,
      value: jsonEncode(currentTracks.map((e) => e.toJson()).toList()),
    );
  }

  List<SavedTrack> getTracksFromStorage() {
    final items = localStorageUsecase.getString<List<dynamic>>(key: _songsKey);

    if (items == null) {
      return <SavedTrack>[];
    }

    return items
        .map(
          (e) => SavedTrack.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}

final class FavoriteSongsUsecase {
  const FavoriteSongsUsecase(this._favoriteSongsImpl, this._favoriteSongsLocal);

  final FavoriteSongsImpl _favoriteSongsImpl;
  final FavoriteSongsLocal _favoriteSongsLocal;

  ApiResult<void> getFavoriteSongs(int offset) {
    return TaskEither.tryCatch(
      () async {
        final newTracks = await _favoriteSongsLocal.getFavoriteSongs(offset);

        final shouldUpdate =
            _favoriteSongsLocal.shouldSendToDb(newTracks: newTracks);

        if (shouldUpdate) {
          await _favoriteSongsImpl.addSongs(songs: newTracks);
          _favoriteSongsLocal.saveTracksInStorage(newTracks: newTracks);
        }
      },
      (error, stackTrace) => GetFavoriteTrackException(error: error),
    );
  }
}
