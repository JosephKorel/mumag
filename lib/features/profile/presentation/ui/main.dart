import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/profile_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);

    /*  void checkInfo() async {
      final user = await spotify.me.recentlyPlayed().first();
      final credentials = user.items;
      // log('USUÁRIO É ${user.scopes.toString()}');
    } */

    return user.when(
      data: (data) => const UserProfileView(),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Text('Something went wrong'),
            /*  ElevatedButton(onPressed: checkInfo, child: const Text('Check info')), */
          ],
        ),
      ),
      loading: ProfileLoadingScreen.new,
    );
  }
}

class ProfileLoadingScreen extends StatelessWidget {
  const ProfileLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
