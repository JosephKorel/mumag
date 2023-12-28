import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';
import 'package:mumag/features/profile/presentation/ui/user_ratings.dart';

class ProfileMainView extends ConsumerStatefulWidget {
  const ProfileMainView({super.key});

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
        ref
            .read(scrollOffsetProvider.notifier)
            .onScroll(_scrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).requireValue!;

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
                const ProfilePicture(),
                Text(
                  user.name,
                  style: context.titleLarge.copyWith(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: const UserRatingsWidget(),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SavedAlbumsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends ConsumerWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImg = ref.watch(
      userProvider.select((value) => value.requireValue!.avatarUrl),
    );

    if (profileImg == null) {
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
        backgroundImage: NetworkImage(profileImg),
      ),
    );
  }
}
