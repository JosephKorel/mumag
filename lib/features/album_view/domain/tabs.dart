import 'package:flutter/material.dart';

enum AlbumTabs {
  about('About'),
  tracks('Tracks'),
  rating('Rating');

  const AlbumTabs(this.label);

  final String label;
}

extension AlbumTabIcons on AlbumTabs {
  IconData get icon => [
        Icons.info_outline,
        Icons.library_music_outlined,
        Icons.star_outline,
      ][index];
}
