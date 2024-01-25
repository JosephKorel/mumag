import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/search_users/providers/search.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/search/search_user/card.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

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
    final searching = ref.watch(searchValueProvider).isNotEmpty;

    final results = ref.watch(searchResultProvider);
    final userId = ref.watch(localUserProvider)!.id;

    if (results.hasValue) {
      final data = results.requireValue.fold(
        (l) => null,
        (r) => r.where((element) => element.id != userId).toList(),
      );

      if (data == null) {
        return const Text('Something went wrong');
      }

      if (data.isEmpty && searching) {
        return const Text('No user found');
      }

      return SearchResults<SocialUserSimple>(
        data: data,
        widgetList: data
            .map(
              (e) => FoundUserCard(
                user: e,
              ),
            )
            .toList(),
      );
    }

    return const SizedBox.shrink();
  }
}

class SearchResults<T> extends ConsumerWidget {
  const SearchResults({
    required this.data,
    required this.widgetList,
    super.key,
  });

  final List<T> data;
  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewingUserIdProvider);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          top: index == 0 ? 0 : 8,
          bottom: index == data.length - 1 ? 0 : 8,
        ),
        child: widgetList[index],
      ),
    );
  }
}
