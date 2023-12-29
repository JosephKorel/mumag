import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/routes/routes.dart';

class FoundUserCard extends ConsumerWidget {
  const FoundUserCard({required this.user, super.key});

  final SocialUserSimple user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTap() {
      ref.read(viewingUserIdProvider.notifier).selectUser(user.id);
      context.push(const ViewUserRoute().location);
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.onSurface.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.hardEdge,
                child: CachedImage(
                  url: user.avatarUrl,
                  width: 42,
                  height: 42,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      user.name,
                      style: context.titleMedium.copyWith(fontSize: 18),
                    ),
                    Text(
                      user.genres.sublist(0, 3).join(', ').toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.bodySmall
                          .copyWith(color: context.onSurface.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(),
    );
  }
}
