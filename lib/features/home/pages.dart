import 'package:flutter/material.dart';
import 'package:mumag/features/profile/presentation/ui/main.dart';
import 'package:mumag/features/search/presentation/ui/main.dart';

enum Pages { search, profile }

extension BottomNavigationPage on Pages {
  Widget get page => [const SearchView(), const ProfileView()][index];

  BottomNavigationBarItem get navPage => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ][index];
}
