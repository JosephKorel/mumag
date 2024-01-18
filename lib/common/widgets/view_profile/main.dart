import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/loading.dart';

class ViewProfileContainer extends StatelessWidget {
  const ViewProfileContainer({
    required this.user,
    required this.child,
    required this.offset,
    super.key,
    this.appBarActions,
    this.floatingActionButton,
  });

  final AsyncValue<UserEntity?> user;
  final Widget child;
  final double offset;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return user.when(
      data: (data) => _UserProfileView(
        appBarActions: appBarActions,
        headerImgUrl: data!.backgroundUrl,
        offset: offset,
        floatingActionButton: floatingActionButton,
        child: child,
      ),
      error: (_, __) => const Scaffold(),
      loading: _ProfileLoadingScreen.new,
    );
  }
}

class _ProfileLoadingScreen extends StatelessWidget {
  const _ProfileLoadingScreen({super.key});

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

class _UserProfileView extends ConsumerWidget {
  const _UserProfileView({
    required this.child,
    required this.offset,
    this.headerImgUrl,
    this.appBarActions,
    this.floatingActionButton,
  });

  final Widget child;
  final double offset;
  final String? headerImgUrl;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ref.watch(
      dynamicColorSchemeProvider(imageUrl: headerImgUrl),
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
                backgroundUrl: headerImgUrl,
                offset: offset,
              ),
              Column(
                children: [
                  const Expanded(child: SizedBox.expand()),
                  Expanded(
                    flex: 3,
                    child: child,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const Scaffold(),
      loading: _ProfileLoadingScreen.new,
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
