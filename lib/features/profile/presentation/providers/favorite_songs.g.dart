// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_songs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedSongsHash() => r'2c1a165b70a9bb13ff1f54c93ea6c87acd537dbd';

/// See also [savedSongs].
@ProviderFor(savedSongs)
final savedSongsProvider = AutoDisposeProvider<FavoriteSongsLocal>.internal(
  savedSongs,
  name: r'savedSongsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$savedSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedSongsRef = AutoDisposeProviderRef<FavoriteSongsLocal>;
String _$favoriteSongsImplHash() => r'918f403bd3c4e39a0462cce51db46d7e1b7ec486';

/// See also [favoriteSongsImpl].
@ProviderFor(favoriteSongsImpl)
final favoriteSongsImplProvider =
    AutoDisposeProvider<FavoriteSongsImpl>.internal(
  favoriteSongsImpl,
  name: r'favoriteSongsImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteSongsImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteSongsImplRef = AutoDisposeProviderRef<FavoriteSongsImpl>;
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
String _$favoriteSongsUsecaseHash() =>
    r'f89022fa5ea37847a49d9e4720e11788000d8385';

/// See also [favoriteSongsUsecase].
@ProviderFor(favoriteSongsUsecase)
final favoriteSongsUsecaseProvider =
    AutoDisposeProvider<FavoriteSongsUsecase>.internal(
  favoriteSongsUsecase,
  name: r'favoriteSongsUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteSongsUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteSongsUsecaseRef = AutoDisposeProviderRef<FavoriteSongsUsecase>;
String _$userFavoriteTracksHash() =>
    r'd838a049c52489adc2f045d0c2c5eaff88f68299';

/// See also [userFavoriteTracks].
@ProviderFor(userFavoriteTracks)
final userFavoriteTracksProvider =
    AutoDisposeProvider<List<SavedTrack>>.internal(
  userFavoriteTracks,
  name: r'userFavoriteTracksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userFavoriteTracksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserFavoriteTracksRef = AutoDisposeProviderRef<List<SavedTrack>>;
String _$getUserFavTracksHash() => r'78d86ebcbc24889a609fa8eddb63baff3ffb7e38';

/// See also [getUserFavTracks].
@ProviderFor(getUserFavTracks)
final getUserFavTracksProvider = AutoDisposeFutureProvider<void>.internal(
  getUserFavTracks,
  name: r'getUserFavTracksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserFavTracksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserFavTracksRef = AutoDisposeFutureProviderRef<void>;
String _$favoriteTracksOffsetHash() =>
    r'de4d330d9a924c36cecc372a5aa6dc716f93ecbd';

/// See also [FavoriteTracksOffset].
@ProviderFor(FavoriteTracksOffset)
final favoriteTracksOffsetProvider =
    AutoDisposeNotifierProvider<FavoriteTracksOffset, int>.internal(
  FavoriteTracksOffset.new,
  name: r'favoriteTracksOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteTracksOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteTracksOffset = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
