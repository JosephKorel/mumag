import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/features/profile/presentation/ui/change_background.dart';

enum MenuEntry {
  background('Change Background'),
  signOut('Sign Out');

  const MenuEntry(this.label);

  final String label;
}

class ProfileMenuButton extends ConsumerWidget {
  const ProfileMenuButton({super.key});

  void _openBackgroundBottomSheet(BuildContext context) => showAppBottomSheet(
        context,
        child: const ChangeBackgroundBottomSheet(),
        height: context.deviceHeight / 2,
      );

  Future<void> _onSignOut(WidgetRef ref) async {
    await ref.read(authServiceProvider).signOut();
    ref.read(credentialsImplementationProvider).deleteCredentials();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSelected(MenuEntry item) {
      switch (item) {
        case MenuEntry.background:
          _openBackgroundBottomSheet(context);
        case MenuEntry.signOut:
          _onSignOut(ref);
      }
    }

    return PopupMenuButton<MenuEntry>(
      onSelected: onSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: Icon(
        Icons.more_vert,
        color: context.onPrimary,
      ),
      splashRadius: Material.defaultSplashRadius / 1.5,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuEntry>>[
        PopupMenuItem<MenuEntry>(
          value: MenuEntry.background,
          child: Row(
            children: [
              Icon(
                Icons.image,
                color: context.onBackground,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(MenuEntry.background.label),
            ],
          ),
        ),
        PopupMenuItem<MenuEntry>(
          value: MenuEntry.signOut,
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: context.onBackground,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(MenuEntry.signOut.label),
            ],
          ),
        ),
      ],
    );
  }
}
