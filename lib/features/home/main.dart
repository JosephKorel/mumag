import 'package:flutter/material.dart';
import 'package:mumag/features/home/pages.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({
    super.key,
  });

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int _selectedIndex = 1;

  void _onDestinationSelected(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages.values[_selectedIndex].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: Pages.values.map((e) => e.navPage).toList(),
      ),
    );
  }
}
