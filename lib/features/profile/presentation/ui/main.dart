import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/presentation/providers/theme.dart';
import 'package:mumag/features/profile/presentation/ui/profile_menu.dart';
import 'package:mumag/features/profile/presentation/ui/profile_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return user.when(
      data: (data) => const UserProfileView(),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Text('Something went wrong'),
          ],
        ),
      ),
      loading: ProfileLoadingScreen.new,
    );
  }
}

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).requireValue!;
    final colorScheme = ref.watch(profileColorSchemeProvider);

    return colorScheme.when(
      data: (data) => Theme(
        data: ThemeData(colorScheme: data.light),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: const [ProfileMenuButton()],
          ),
          extendBodyBehindAppBar: true,
          body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user.backgroundUrl!),
                fit: BoxFit.cover,
              ),
            ),
            child: const Column(
              children: [
                Expanded(flex: 2, child: SizedBox.expand()),
                Expanded(
                  child: ProfileMainView(),
                ),
              ],
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => const Scaffold(),
      loading: Scaffold.new,
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
