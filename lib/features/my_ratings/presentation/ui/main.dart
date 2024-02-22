import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/my_ratings/presentation/ui/grid.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';

class AllUserRatingsView extends ConsumerStatefulWidget {
  const AllUserRatingsView({super.key, this.type, this.rating});

  final RatingType? type;
  final int? rating;

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

  void _onClear() {
    setState(() {
      _searchValue = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    log('THE RATING IS: ${widget.rating}');
    final ratings = ref.watch(localUserProvider)!.ratings;
    final showRatings =
        RatingEntity.ratingsByTypeAndValue(ratings, widget.type, widget.rating);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SearchInput(
                onChanged: _onChanged,
                onClear: _onClear,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child:
                  RatingsGrid(ratings: showRatings, searchValue: _searchValue),
            ),
          ],
        ),
      ),
    );
  }
}
