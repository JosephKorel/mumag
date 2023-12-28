import 'package:flutter/material.dart';
import 'package:mumag/features/home/pages.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.onTap,
    required this.activePage,
    super.key,
  });

  final void Function(int page) onTap;
  final int activePage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: activePage,
      onTap: onTap,
      items: Pages.values.map((e) => e.navPage).toList(),
    );
  }
}
