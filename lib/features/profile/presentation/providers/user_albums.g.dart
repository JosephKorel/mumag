// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_albums.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSavedAlbumsHash() => r'd93ddf59141478009dd4dbd9485cf0cb1502181c';

/// See also [userSavedAlbums].
@ProviderFor(userSavedAlbums)
final userSavedAlbumsProvider =
    AutoDisposeFutureProvider<List<AlbumSimple>>.internal(
  userSavedAlbums,
  name: r'userSavedAlbumsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userSavedAlbumsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserSavedAlbumsRef = AutoDisposeFutureProviderRef<List<AlbumSimple>>;
String _$albumListHash() => r'8bc3e1a569310eb99f5d2955bf4c1c88889bfb91';

/// See also [albumList].
@ProviderFor(albumList)
final albumListProvider = AutoDisposeProvider<List<AlbumEntity>>.internal(
  albumList,
  name: r'albumListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$albumListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlbumListRef = AutoDisposeProviderRef<List<AlbumEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
