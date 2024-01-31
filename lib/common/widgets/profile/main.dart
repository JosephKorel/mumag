import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/profile/content.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';

class ProfileContainer extends ConsumerStatefulWidget {
  const ProfileContainer({
    required this.child,
    required this.user,
    super.key,
    this.appBarActions,
    this.floatingActionButton,
  });

  final UserEntity user;
  final Widget child;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileContainerState();
}

class _ProfileContainerState extends ConsumerState<ProfileContainer> {
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
    final appTheme = ref.watch(appThemeProvider);
    final colorScheme = ref.watch(
      dynamicColorSchemeProvider(imageUrl: widget.user.backgroundUrl),
    );

    return colorScheme.when(
      data: (data) => Theme(
        data: appTheme.copyWith(colorScheme: data.light),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: data.light.primary.withOpacity(0.6),
            actions: widget.appBarActions,
            foregroundColor: context.onPrimary,
          ),
          extendBodyBehindAppBar: true,
          floatingActionButton: widget.floatingActionButton,
          body: Stack(
            children: [
              _UserImageHeader(
                backgroundUrl: widget.user.backgroundUrl,
              ),
              Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: ProfileContentWidget(
                      scrollController: _scrollController,
                      user: widget.user,
                      child: widget.child,
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

class _UserImageHeader extends ConsumerWidget {
  const _UserImageHeader({this.backgroundUrl});

  final String? backgroundUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = ref.watch(scrollOffsetProvider);
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
