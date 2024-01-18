// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_albums.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSavedAlbumsHash() => r'a2ad778aecbb67c5168c96f427073f53b6c5a624';

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
String _$albumListHash() => r'd6fc5d52675f76f1a9b797dd1a40397db97116d6';

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
