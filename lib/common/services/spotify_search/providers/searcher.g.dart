// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spotifySearcherHash() => r'ceb7f72424ec09548271e6cba0a46a1d866b995c';

/// See also [spotifySearcher].
@ProviderFor(spotifySearcher)
final spotifySearcherProvider =
    AutoDisposeProvider<SpotifySearchUsecase>.internal(
  spotifySearcher,
  name: r'spotifySearcherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spotifySearcherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpotifySearcherRef = AutoDisposeProviderRef<SpotifySearchUsecase>;
String _$handleSearchHash() => r'704975e6b70e255c70ed17f3e002fe807afbaa2e';

/// See also [handleSearch].
@ProviderFor(handleSearch)
final handleSearchProvider = AutoDisposeFutureProvider<List<dynamic>>.internal(
  handleSearch,
  name: r'handleSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$handleSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HandleSearchRef = AutoDisposeFutureProviderRef<List<dynamic>>;
String _$songSearchParamsHash() => r'e5d34e25f4a537848116a59dc7018db088b65954';

/// See also [SongSearchParams].
@ProviderFor(SongSearchParams)
final songSearchParamsProvider =
    AutoDisposeNotifierProvider<SongSearchParams, SpotifySearchParams>.internal(
  SongSearchParams.new,
  name: r'songSearchParamsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$songSearchParamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SongSearchParams = AutoDisposeNotifier<SpotifySearchParams>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
