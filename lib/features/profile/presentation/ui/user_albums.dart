import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/presentation/providers/user_albums.dart';

class AlbumHeaderView extends ConsumerWidget {
  const AlbumHeaderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(userSavedAlbumsProvider);

    return albums.when(
      data: (data) {
        if (data[0].images == null) {
          return const SizedBox();
        }

        return SizedBox(
          width: double.infinity,
          height: 300,
          child: Image.network(data[0].images![0].url!),
        );
      },
      error: (error, stackTrace) => const Text('Some error'),
      loading: CircularProgressIndicator.new,
    );
  }
}

class SavedAlbumsView extends ConsumerWidget {
  const SavedAlbumsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(userSavedAlbumsProvider);
    return albums.when(
      data: (data) => ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final album = data[index];
          return Column(
            children: [
              Text(album.name!),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Open in New'),
              ),
            ],
          );
        },
      ),
      error: (error, stackTrace) => const Text('Some error'),
      loading: CircularProgressIndicator.new,
    );
  }
}

class ProfileTest extends ConsumerWidget {
  const ProfileTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).requireValue!;
    final userApi = ref.watch(userApiProvider);

    void changeUser() {
      final newDate = user.lastUpdatedAt.add(const Duration(days: 4));

      userApi
          .updateUser(userEntity: user.copyWith(lastUpdatedAt: newDate))
          .run();
    }

    return ElevatedButton(onPressed: changeUser, child: const Text('Test'));
  }
}
