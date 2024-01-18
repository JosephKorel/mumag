import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/profile/content.dart';

class ProfileContainer extends ConsumerWidget {
  const ProfileContainer({
    required this.asyncUser,
    required this.user,
    required this.children,
    required this.offset,
    required this.onScroll,
    super.key,
    this.appBarActions,
    this.floatingActionButton,
  });
  final AsyncValue<UserEntity?> asyncUser;
  final UserEntity? user;
  final List<Widget> children;
  final double offset;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;
  final void Function(double offset) onScroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold();

    /* return _UserProfileView(
      appBarActions: appBarActions,
      offset: offset,
      floatingActionButton: floatingActionButton,
      onScroll: onScroll,
      children: children,
    ); */
  }
}

class ProfileLoadingScreen extends StatelessWidget {
  const ProfileLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoadingSkeleton(height: 300),
          Column(
            children: [
              const Expanded(child: SizedBox.expand()),
              Expanded(
                flex: 3,
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      color: context.background,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          LoadingSkeleton(
                            height: 68,
                            width: 68,
                            borderRadius: 34,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          LoadingSkeleton(
                            height: 18,
                            width: 180,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserProfileView extends ConsumerWidget {
  const UserProfileView({
    required this.children,
    required this.offset,
    required this.onScroll,
    required this.user,
    super.key,
    this.appBarActions,
    this.floatingActionButton,
  });

  final UserEntity user;
  final List<Widget> children;
  final double offset;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;
  final void Function(double offset) onScroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ref.watch(
      dynamicColorSchemeProvider(imageUrl: user.backgroundUrl),
    );

    return colorScheme.when(
      data: (data) => Theme(
        data: ThemeData(colorScheme: data.light),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: data.light.primary.withOpacity(0.4),
            actions: appBarActions,
          ),
          extendBodyBehindAppBar: true,
          floatingActionButton: floatingActionButton,
          body: Stack(
            children: [
              _UserImageHeader(
                backgroundUrl: user.backgroundUrl,
                offset: offset,
              ),
              Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: ProfileMainView(
                      user: user,
                      onScroll: onScroll,
                      children: children,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const Scaffold(),
      loading: ProfileLoadingScreen.new,
    );
  }
}

class _UserImageHeader extends StatelessWidget {
  const _UserImageHeader({required this.offset, this.backgroundUrl});

  final double offset;
  final String? backgroundUrl;

  @override
  Widget build(BuildContext context) {
    final scrollOffset = offset / 56;

    return Image(
      image: NetworkImage(backgroundUrl!),
      alignment: Alignment(0, scrollOffset),
      fit: BoxFit.cover,
      width: double.infinity * 1.2,
      height: MediaQuery.of(context).size.height / 2.5,
    );
  }
}
