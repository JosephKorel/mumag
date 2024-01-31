import 'package:flutter/material.dart';
import 'package:mumag/features/profile/presentation/ui/performant.dart';
import 'package:mumag/features/search/presentation/ui/main.dart';

enum Pages { search, profile }

extension BottomNavigationPage on Pages {
  Widget get page => [const SearchView(), const ProfilePerformantView()][index];

  NavigationDestination get navPage => [
        const NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        const NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ][index];
}
