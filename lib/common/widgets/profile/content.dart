import 'package:flutter/material.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/image.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({
    required this.user,
    required this.scrollController,
    required this.child,
    super.key,
  });

  final Widget child;
  final UserEntity user;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: context.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(this.avatarUrl, {super.key});

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    if (avatarUrl == null) {
      return Center(
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const Icon(
            Icons.person,
            size: 52,
          ),
        ),
      );
    }

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: CachedImage(
          url: avatarUrl!,
          height: 52,
          width: 52,
        ),
      ),
    );
  }
}

class ProfileBadgeGenres extends StatelessWidget {
  const ProfileBadgeGenres({required this.genres, super.key});

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    final genresBadges = genres
        .map(
          (e) => Chip(
            label: Text(e.toUpperCase()),
            padding: EdgeInsets.zero,
            labelStyle: context.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: context.onPrimaryContainer,
            ),
            backgroundColor: context.primaryContainer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: BorderSide.none,
          ),
        )
        .toList();

    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}

class DisplayUsername extends StatelessWidget {
  const DisplayUsername({required this.name, super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.titleMedium,
    );
  }
}
