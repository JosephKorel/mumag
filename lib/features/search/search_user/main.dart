import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/search_users/providers/search.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';
import 'package:mumag/features/search/search_user/card.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

class SearchForUserView extends StatelessWidget {
  const SearchForUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Scaffold(
        appBar: AppBar(
          title: const SearchInputContainer(),
        ),
        body: const SearchResultsContainer(),
      ),
    );
  }
}

class SearchInputContainer extends ConsumerWidget {
  const SearchInputContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(searchValueProvider);

    return SearchInput(
      onChanged: ref.read(searchValueProvider.notifier).onSearch,
      provider: searchValueProvider,
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

      if (!results.isLoading && data.isEmpty && searching) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Text(
              'No user found',
              style: context.titleLarge
                  .copyWith(color: context.onSurface.withOpacity(0.6)),
              textAlign: TextAlign.center,
            ),
          ),
        );
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
