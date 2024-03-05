import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class FavoriteTitlesEntity with _$FavoriteTitlesEntity {
  factory FavoriteTitlesEntity({
    required int id,
    required String songsTitle,
    required String albumsTitle,
    required String artistsTitle,
    required List<int> songsLike,
    required List<int> albumsLike,
    required List<int> artistsLike,
  }) = _FavoriteTitlesEntity;

  factory FavoriteTitlesEntity.fromJson(Map<String, dynamic> json) =>
      _$FavoriteTitlesEntityFromJson(json);

  factory FavoriteTitlesEntity.initialValue() => FavoriteTitlesEntity(
        id: 0,
        songsTitle: 'My top 10 songs',
        albumsTitle: 'My top 10 albums',
        artistsTitle: 'My top 10 artists',
        songsLike: [],
        albumsLike: [],
        artistsLike: [],
      );
}
