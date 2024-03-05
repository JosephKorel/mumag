import 'package:mumag/features/profile/domain/favorite_song/entity.dart';

mixin FavoriteSongsEditionController {
  final _selectedSongs = <SingleTrack>[];

  List<SingleTrack> get selectedSongs => _selectedSongs;

  void onSongTap(SingleTrack track) {
    _selectedSongs.contains(track)
        ? _selectedSongs.remove(track)
        : _selectedSongs.add(track);
  }
}
