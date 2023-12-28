import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/search_users/providers/search.dart';

class SearchForUserView extends StatelessWidget {
  const SearchForUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _SearchInput(),
      ),
      body: const SearchResultsContainer(),
    );
  }
}

class _SearchInput extends ConsumerWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(searchValueProvider);

    return TextField(
      onChanged: ref.read(searchValueProvider.notifier).onSearch,
      decoration: const InputDecoration(
        hintText: 'Search',
      ),
    );
  }
}

class SearchResultsContainer extends ConsumerWidget {
  const SearchResultsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(searchResultProvider);

    if (results.hasValue) {
      final data = results.requireValue.fold((l) => null, (r) => r);

      if (data == null) {
        return const Text('Something went wrong');
      }

      final widgetList = data
          .map(
            (e) => Text(e.name),
          )
          .toList();

      return SearchResults<SocialUserSimple>(
        data: data,
        widgetList: widgetList,
      );
    }

    return const SizedBox.shrink();
  }
}

class SearchResults<T> extends StatelessWidget {
  const SearchResults({
    required this.data,
    required this.widgetList,
    super.key,
  });

  final List<T> data;
  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => widgetList[index],
    );
  }
}
