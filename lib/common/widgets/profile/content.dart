import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/theme/utils.dart';

class ProfileMainView extends ConsumerStatefulWidget {
  const ProfileMainView({
    required this.user,
    required this.onScroll,
    required this.children,
    super.key,
  });

  final List<Widget> children;
  final AsyncValue<UserEntity?> user;
  final void Function(double offset) onScroll;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileMainViewState();
}

class _ProfileMainViewState extends ConsumerState<ProfileMainView> {
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
    if (!widget.user.hasValue) {
      return const SizedBox.shrink();
    }

    final user = widget.user.requireValue!;

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
                _ProfilePicture(user.avatarUrl),
                Text(
                  user.name,
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
      child: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(avatarUrl!),
      ),
    );
  }
}

class ProfileGenres extends StatefulWidget {
  const ProfileGenres({
    required this.genres,
    super.key,
    this.updateGenres,
  });

  final List<String> genres;
  final void Function()? updateGenres;

  @override
  State<ProfileGenres> createState() => ProfileGenresState();
}

class ProfileGenresState extends State<ProfileGenres> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Update user genres every 7 days
      widget.updateGenres?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    final genresBadges = widget.genres
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
          ),
        )
        .toList();

    return Wrap(
      spacing: 2,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}
