import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';
import 'package:mumag/features/artist_view/ui/content.dart';

class ArtistMainView extends ConsumerWidget {
  const ArtistMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artist = ref.watch(viewingArtistProvider);

    return artist.when(
      data: (data) => const ArtistMainViewLoaded(),
      error: (error, stackTrace) => const Scaffold(),
      loading: Scaffold.new,
    );
  }
}

class ArtistMainViewLoading extends StatelessWidget {
  const ArtistMainViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const LoadingSkeleton(height: 300),
          Column(
            children: [
              const Expanded(
                child: SizedBox.expand(),
              ),
              Expanded(
                flex: 3,
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
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

class ArtistMainViewError extends StatelessWidget {
  const ArtistMainViewError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.onSurface.withOpacity(0.8),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: Center(
                child: Icon(
                  Icons.error,
                  size: 64,
                  color: context.background,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Expanded(
                child: SizedBox.expand(),
              ),
              Expanded(
                flex: 3,
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Something went wrong!',
                            style: context.titleLarge,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          FilledButton(
                            onPressed: context.pop,
                            child: const Text('Go Back'),
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

class ArtistMainViewLoaded extends ConsumerWidget {
  const ArtistMainViewLoaded({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artist = ref.watch(viewingArtistProvider).requireValue;

    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name!),
        backgroundColor: context.onSurface.withOpacity(0.6),
        foregroundColor: context.background,
      ),
      body: const ArtistPageContent(),
      extendBodyBehindAppBar: true,
      floatingActionButton: const ArtistRatingFloatingActionButton(),
    );
  }
}
