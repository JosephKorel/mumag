import 'package:spotify/spotify.dart';

final class SpotifySearchParams {
  const SpotifySearchParams({
    required this.searchType,
    required this.searchValue,
    this.offset = 0,
  });

  factory SpotifySearchParams.songSearch() => const SpotifySearchParams(
        searchType: [SearchType.track],
        searchValue: '',
      );

  final List<SearchType> searchType;
  final String searchValue;
  final int offset;

  SpotifySearchParams copyWith({
    List<SearchType>? searchType,
    String? searchValue,
    int? offset,
  }) {
    return SpotifySearchParams(
      searchType: searchType ?? this.searchType,
      searchValue: searchValue ?? this.searchValue,
      offset: offset ?? this.offset,
    );
  }
}
