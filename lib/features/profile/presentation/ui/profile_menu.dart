import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/features/profile/presentation/ui/change_background.dart';

enum MenuEntry {
  background('Change Background');

  const MenuEntry(this.label);

  final String label;
}

class ProfileMenuButton extends ConsumerStatefulWidget {
  const ProfileMenuButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileMenuButtonState();
}

class _ProfileMenuButtonState extends ConsumerState<ProfileMenuButton> {
  void _openBackgroundBottomSheet() => showAppBottomSheet(
        context,
        child: const ChangeBackgroundBottomSheet(),
      );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuEntry>(
      onSelected: (MenuEntry item) {
        _openBackgroundBottomSheet();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: const Icon(Icons.settings),
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
      ],
    );
  }
}