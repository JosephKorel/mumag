import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/search_users/providers/search.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
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
          title: const _SearchInput(),
        ),
        body: const SearchResultsContainer(),
      ),
    );
  }
}

class _SearchInput extends ConsumerStatefulWidget {
  const _SearchInput();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __SearchInputState();
}

class __SearchInputState extends ConsumerState<_SearchInput> {
  final _controller = TextEditingController();

  void _clear() {
    _controller.clear();
    ref.invalidate(searchValueProvider);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(searchValueProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: TextField(
        controller: _controller,
        onChanged: ref.read(searchValueProvider.notifier).onSearch,
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: value.isEmpty ? null : _clear,
            icon: Icon(
              Icons.clear,
              color: value.isEmpty ? Colors.transparent : null,
            ),
          ),
          filled: true,
          fillColor: context.onSurface.withOpacity(0.1),
          border: InputBorder.none,
        ),
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
