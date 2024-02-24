import 'package:spotify/spotify.dart';

class SpotifySearchParams {
  const SpotifySearchParams({
    required this.searchType,
    required this.searchValue,
    this.offset = 0,
  });

  final List<SearchType> searchType;
  final String searchValue;
  final int offset;
}
