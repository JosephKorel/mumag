import 'package:flutter/material.dart';
import 'package:mumag/features/search/search_user/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: 'Users',
                icon: Icon(Icons.person_2_outlined),
              ),
              Tab(
                text: 'Content',
                icon: Icon(Icons.library_music_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [SearchForUserView(), SearchForUserView()],
        ),
      ),
    );
  }
}
