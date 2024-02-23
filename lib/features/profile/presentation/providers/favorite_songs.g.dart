// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_songs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedSongsHash() => r'84be68c00dc3ae0e380c13c9c12b3b41fb95d179';

/// See also [savedSongs].
@ProviderFor(savedSongs)
final savedSongsProvider = AutoDisposeProvider<SavedSongsUsecase>.internal(
  savedSongs,
  name: r'savedSongsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$savedSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedSongsRef = AutoDisposeProviderRef<SavedSongsUsecase>;
String _$getFavoriteSongsHash() => r'e8ae0f2ce89445677b7b3135bbb9c9ff6e08528f';

/// See also [getFavoriteSongs].
@ProviderFor(getFavoriteSongs)
final getFavoriteSongsProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  getFavoriteSongs,
  name: r'getFavoriteSongsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFavoriteSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavoriteSongsRef = AutoDisposeFutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
