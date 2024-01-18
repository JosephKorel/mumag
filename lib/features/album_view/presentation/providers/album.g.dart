// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumColorSchemeHash() => r'27a9ce4de034d4e8e6a747fed99e206d22f4a76b';

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
String _$albumRatingHash() => r'2820b2c604c1481fc5ae0a9f6caefa922cb410a1';

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
String _$albumGenresHash() => r'ab658d7c429839b149adb71350f929473563fcf0';

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
String _$viewingAlbumHash() => r'7a64066f4e860ac09dad478cc9476c7b7a915adf';

/// See also [ViewingAlbum].
@ProviderFor(ViewingAlbum)
final viewingAlbumProvider =
    AutoDisposeAsyncNotifierProvider<ViewingAlbum, Album?>.internal(
  ViewingAlbum.new,
  name: r'viewingAlbumProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$viewingAlbumHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ViewingAlbum = AutoDisposeAsyncNotifier<Album?>;
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
