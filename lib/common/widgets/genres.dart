import 'package:flutter/widgets.dart';
import 'package:mumag/common/theme/utils.dart';

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
          (e) => DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor?.withOpacity(0.8) ??
                  context.primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor?.withOpacity(0.4) ??
                    context.primary.withOpacity(0.4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                e.toUpperCase(),
                style: context.bodyMedium.copyWith(
                  color: textColor ?? context.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
        .toList();

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}
