import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/my_ratings/presentation/ui/grid.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';

class AllUserRatingsView extends ConsumerStatefulWidget {
  const AllUserRatingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllUserRatingsViewState();
}

class _AllUserRatingsViewState extends ConsumerState<AllUserRatingsView> {
  String _searchValue = '';

  void _onChanged(String value) {
    setState(() {
      _searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ratings = ref.watch(localUserProvider)!.ratings;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchInput(onChanged: _onChanged),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: RatingsGrid(ratings: ratings, searchValue: _searchValue),
            ),
          ],
        ),
      ),
    );
  }
}
