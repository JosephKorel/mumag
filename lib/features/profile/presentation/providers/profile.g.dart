// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileHash() => r'8a41ef4d6cd804b9d7e953cc3d2c4cfa672ac721';

/// See also [userProfile].
@ProviderFor(userProfile)
final userProfileProvider = AutoDisposeFutureProvider<User>.internal(
  userProfile,
  name: r'userProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserProfileRef = AutoDisposeFutureProviderRef<User>;
String _$savedAlbumsHash() => r'1377b1bdc59152d05b06b33d06c45e3d836f8d0f';

/// See also [savedAlbums].
@ProviderFor(savedAlbums)
final savedAlbumsProvider =
    AutoDisposeFutureProvider<List<AlbumSimple>>.internal(
  savedAlbums,
  name: r'savedAlbumsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$savedAlbumsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedAlbumsRef = AutoDisposeFutureProviderRef<List<AlbumSimple>>;
String _$selectedAlbumCoverHash() =>
    r'dca2e30161460f09a24e44006af78a3991a478c0';

/// See also [SelectedAlbumCover].
@ProviderFor(SelectedAlbumCover)
final selectedAlbumCoverProvider =
    AutoDisposeNotifierProvider<SelectedAlbumCover, String?>.internal(
  SelectedAlbumCover.new,
  name: r'selectedAlbumCoverProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedAlbumCoverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedAlbumCover = AutoDisposeNotifier<String?>;
String _$scrollOffsetHash() => r'dc9e3035962f1b0304b1f255c69fe3fc550a3745';

/// See also [ScrollOffset].
@ProviderFor(ScrollOffset)
final scrollOffsetProvider =
    AutoDisposeNotifierProvider<ScrollOffset, double>.internal(
  ScrollOffset.new,
  name: r'scrollOffsetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$scrollOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScrollOffset = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
