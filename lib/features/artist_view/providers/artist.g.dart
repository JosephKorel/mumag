// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewingArtistHash() => r'b2bf6337ef6fe33d6b5a0465703d9dacc648345d';

/// See also [viewingArtist].
@ProviderFor(viewingArtist)
final viewingArtistProvider = AutoDisposeFutureProvider<Artist>.internal(
  viewingArtist,
  name: r'viewingArtistProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewingArtistHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ViewingArtistRef = AutoDisposeFutureProviderRef<Artist>;
String _$artistAlbumsHash() => r'b03aed3e584371eae7d63c1f8e49eaf49ec2e8c0';

/// See also [artistAlbums].
@ProviderFor(artistAlbums)
final artistAlbumsProvider =
    AutoDisposeFutureProvider<List<AlbumSimple>>.internal(
  artistAlbums,
  name: r'artistAlbumsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$artistAlbumsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ArtistAlbumsRef = AutoDisposeFutureProviderRef<List<AlbumSimple>>;
String _$selectedArtistHash() => r'1c9b95b3bbcefa1c08ff07d78ae50d2db04da4b3';

/// See also [SelectedArtist].
@ProviderFor(SelectedArtist)
final selectedArtistProvider =
    AutoDisposeNotifierProvider<SelectedArtist, ArtistSimple?>.internal(
  SelectedArtist.new,
  name: r'selectedArtistProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedArtistHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedArtist = AutoDisposeNotifier<ArtistSimple?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
