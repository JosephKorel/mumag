import 'package:flutter/material.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/image.dart';

class ProfileMainView extends StatefulWidget {
  const ProfileMainView({
    required this.user,
    required this.onScroll,
    required this.children,
    super.key,
  });

  final List<Widget> children;
  final UserEntity user;
  final void Function(double offset) onScroll;

  @override
  State<ProfileMainView> createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<ProfileMainView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        widget.onScroll(_scrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ProfilePicture(widget.user.avatarUrl),
                Text(
                  widget.user.name,
                  style: context.titleLarge.copyWith(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                ...widget.children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture(this.avatarUrl);

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
