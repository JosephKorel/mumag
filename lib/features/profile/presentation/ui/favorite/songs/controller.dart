import 'package:flutter/material.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:spotify/spotify.dart';

mixin FavoriteSongsEditionController {
  final controller = ScrollController();
  int offset = 0;
  bool loading = true;
  final _selectedSongs = <SingleTrack>[];
  final _foundSongs = <SingleTrack>[];

  List<SingleTrack> get songs => _foundSongs;

  List<SingleTrack> get selectedSongs => _selectedSongs;

  void onSongTap(SingleTrack track) {
    _selectedSongs.contains(track)
        ? _selectedSongs.remove(track)
        : _selectedSongs.add(track);
  }

  void addSongs(List<dynamic> items) {
    _foundSongs.addAll(
      items.whereType<Track>().map(SingleTrack.fromSpotifyTrack).toList(),
    );
  }
}
