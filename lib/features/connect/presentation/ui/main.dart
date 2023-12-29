import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ConnectToSpotifyView extends ConsumerWidget {
  const ConnectToSpotifyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(handleConnectionProvider);

    Future<void> connect() async {
      await ref.read(handleConnectionProvider.notifier).connect();
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/connect-img.png'),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0xFF151416),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: connect,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: Colors.white,
                        textStyle: context.titleMedium,
                        side: const BorderSide(width: 1.6, color: Colors.white),
                        padding: const EdgeInsets.all(12),
                      ),
                      icon: const Icon(PhosphorIconsBold.spotifyLogo),
                      label: const Text('CONNECT SPOTIFY'),
                    )
                        .animate()
                        .fadeIn()
                        .slideY(begin: 8, curve: Curves.easeOutCirc),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
