import 'package:collection/collection.dart';
import 'package:spotify/spotify.dart';

class SearchAdapter {
  const SearchAdapter();

  double _jaccardSimilarity(String str1, String str2) {
    final set1 = Set<String>.from(str1.runes.map(String.fromCharCode));
    final set2 = Set<String>.from(str2.runes.map(String.fromCharCode));

    final intersection = set1.intersection(set2);
    final union = set1.union(set2);

    final similarity = intersection.length / union.length;

    return similarity;
  }

  List<dynamic> searchForCompatibility(
    String searchValue,
    List<dynamic> items,
  ) {
    final dataMap = <int, double>{};

    items.forEachIndexed((index, e) {
      var name = '';

      if (e is AlbumSimple || e is Track || e is Artist) {
        name = e.name as String? ?? '';
      }

      if (name.isEmpty) {
        return;
      }

      final distance =
          _jaccardSimilarity(searchValue.toLowerCase(), name.toLowerCase());

      dataMap[index] = distance;
    });

    final sortedItems = Map.fromEntries(
      dataMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
    ).keys.map((e) => items[e]).toList();

    return sortedItems;
  }
}
