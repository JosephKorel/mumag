import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/services/shared_pref/usecase/local_data.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';

final class LocalFavoriteSongs {
  const LocalFavoriteSongs(this._instance);

  final LocalStorageUsecase _instance;

  static const _key = 'favoriteSongs';

  Future<Either<AppException, void>> setSongs(List<SingleTrack> songs) async {
    return _instance
        .setString(
          key: _key,
          value: jsonEncode(songs.map((e) => e.toJson()).toList()),
        )
        .run();
  }

  List<SingleTrack> getSongs() {
    final songs = _instance.getString<List<dynamic>>(key: _key);

    if (songs == null) {
      return [];
    }

    return songs
        .whereType<Map<String, dynamic>>()
        .map(SingleTrack.fromJson)
        .toList();
  }
}
