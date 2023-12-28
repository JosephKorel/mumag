import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/widgets/bottom_navigation.dart';
import 'package:mumag/features/home/pages.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final _controller = PageController(initialPage: Pages.values.length - 1);
  int _activePage = Pages.values.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int pageIndex) => setState(() {
        _activePage = pageIndex;
        _controller.animateToPage(
          _activePage,
          duration: .1.seconds,
          curve: Curves.linear,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: _onPageChanged,
        itemCount: Pages.values.length,
        itemBuilder: (context, index) => Pages.values[index].page,
      ),
      bottomNavigationBar: AppBottomNavBar(
        activePage: _activePage,
        onTap: _onPageChanged,
      ),
    );
  }
}
