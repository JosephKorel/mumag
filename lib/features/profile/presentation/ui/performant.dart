import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/profile/presentation/ui/main.dart';
import 'package:mumag/routes/routes.dart';

class ProfilePerformantView extends ConsumerStatefulWidget {
  const ProfilePerformantView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfilePerformantViewState();
}

class _ProfilePerformantViewState extends ConsumerState<ProfilePerformantView> {
  final _scrollController = ScrollController();
  double _offset = 0;

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
        _offset = _scrollController.offset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(localUserProvider)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.primary.withOpacity(0.6),
        foregroundColor: context.onPrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(const HomeRoute().location),
        child: const Icon(Icons.abc),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _UserImageHeader(
            backgroundUrl: user.backgroundUrl,
            offset: _offset,
          ),
          Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: ProfileMainView(
                  controller: _scrollController,
                ),
              ),
            ],
          ),
        ],
      ),
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

class ProfileMainView extends ConsumerWidget {
  const ProfileMainView({required this.controller, super.key});

  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: SingleChildScrollView(
        controller: controller,
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
            child: Content(),
          ),
        ),
      ),
    );
  }
}
