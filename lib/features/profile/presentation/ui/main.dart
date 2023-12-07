import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
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
    final colorScheme = ref.watch(profileColorSchemeProvider);

    return colorScheme.when(
      data: (data) => Theme(
        data: ThemeData(colorScheme: data.light),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: data.light.primary.withOpacity(0.4),
            actions: const [ProfileMenuButton()],
          ),
          extendBodyBehindAppBar: true,
          body: const Stack(
            children: [
              UserImageHeader(),
              Column(
                children: [
                  Expanded(child: SizedBox.expand()),
                  Expanded(
                    flex: 3,
                    child: ProfileMainView(),
                  ),
                ],
              ),
            ],
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

class UserImageHeader extends ConsumerWidget {
  const UserImageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).requireValue!;
    final scrollOffset = ref.watch(scrollOffsetProvider) / 56;

    return Image(
      image: NetworkImage(user.backgroundUrl!),
      alignment: Alignment(0, scrollOffset),
      fit: BoxFit.cover,
      width: double.infinity * 1.2,
      height: MediaQuery.of(context).size.height / 2.5,
    );
  }
}
