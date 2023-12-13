// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumColorSchemeHash() => r'05e07eb77bae0e3722e643bdcc6582442d246147';

/// See also [albumColorScheme].
@ProviderFor(albumColorScheme)
final albumColorSchemeProvider =
    AutoDisposeFutureProvider<AppColorScheme>.internal(
  albumColorScheme,
  name: r'albumColorSchemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$albumColorSchemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlbumColorSchemeRef = AutoDisposeFutureProviderRef<AppColorScheme>;
String _$albumRatingHash() => r'c366071d2b734d59789696a7f3058e2e8982f80b';

/// See also [albumRating].
@ProviderFor(albumRating)
final albumRatingProvider =
    AutoDisposeFutureProvider<List<RatingEntity>?>.internal(
  albumRating,
  name: r'albumRatingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$albumRatingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlbumRatingRef = AutoDisposeFutureProviderRef<List<RatingEntity>?>;
String _$albumGenresHash() => r'402d5cc565aefc2a1ca0a658d432226ebcddd580';

/// See also [albumGenres].
@ProviderFor(albumGenres)
final albumGenresProvider = AutoDisposeFutureProvider<List<String>>.internal(
  albumGenres,
  name: r'albumGenresProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$albumGenresHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlbumGenresRef = AutoDisposeFutureProviderRef<List<String>>;
String _$viewingAlbumHash() => r'f0d5aaf888fce914081eff28fbc1b607c996cc09';

/// See also [ViewingAlbum].
@ProviderFor(ViewingAlbum)
final viewingAlbumProvider =
    AutoDisposeNotifierProvider<ViewingAlbum, AlbumSimple?>.internal(
  ViewingAlbum.new,
  name: r'viewingAlbumProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$viewingAlbumHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ViewingAlbum = AutoDisposeNotifier<AlbumSimple?>;
String _$viewingRatingHash() => r'5ec83334324d0f10a59f6ff8f2d8d37f79b21229';

/// See also [ViewingRating].
@ProviderFor(ViewingRating)
final viewingRatingProvider =
    AutoDisposeNotifierProvider<ViewingRating, bool>.internal(
  ViewingRating.new,
  name: r'viewingRatingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewingRatingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ViewingRating = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
