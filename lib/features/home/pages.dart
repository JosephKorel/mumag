import 'package:flutter/material.dart';
import 'package:mumag/features/profile/presentation/ui/main.dart';
import 'package:mumag/features/search/presentation/ui/main.dart';
import 'package:mumag/routes/routes.dart';

enum Pages { search, profile }

extension BottomNavigationPage on Pages {
  Widget get page => [const SearchView(), const ProfileView()][index];

  String get path =>
      [const SearchRoute().location, const ProfileRoute().location][index];

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
