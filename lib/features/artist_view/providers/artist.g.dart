// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewingArtistHash() => r'770b363d1797c6e2aaadc77dfc523f5c5f45af42';

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
String _$viewingArtistIdHash() => r'4d88a455c292e044a7e20882639e99e1201572ae';

/// See also [ViewingArtistId].
@ProviderFor(ViewingArtistId)
final viewingArtistIdProvider =
    AutoDisposeNotifierProvider<ViewingArtistId, String?>.internal(
  ViewingArtistId.new,
  name: r'viewingArtistIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewingArtistIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ViewingArtistId = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
