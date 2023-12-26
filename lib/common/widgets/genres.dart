import 'package:flutter/material.dart';

class ContentGenres extends StatelessWidget {
  const ContentGenres({
    required this.genres,
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  final List<String> genres;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final genresBadges = genres
        .map(
          (e) => Chip(label: Text(e)),
        )
        .toList();

    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}
