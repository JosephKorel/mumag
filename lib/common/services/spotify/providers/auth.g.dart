// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectSpotifyHash() => r'bb998e9ba8383704dfae14ca9edf8d3638db47b0';

/// See also [connectSpotify].
@ProviderFor(connectSpotify)
final connectSpotifyProvider = AutoDisposeFutureProvider<bool>.internal(
  connectSpotify,
  name: r'connectSpotifyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectSpotifyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectSpotifyRef = AutoDisposeFutureProviderRef<bool>;
String _$capabilitiesHash() => r'2d2a761b4602cb9b5b0eac924427e60f37da9f28';

/// See also [capabilities].
@ProviderFor(capabilities)
final capabilitiesProvider =
    AutoDisposeStreamProvider<ConnectionStatus>.internal(
  capabilities,
  name: r'capabilitiesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$capabilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CapabilitiesRef = AutoDisposeStreamProviderRef<ConnectionStatus>;
String _$spotifyClientHash() => r'738cf151e9f5d64f25649fc119ab8dd4071a8a01';

/// See also [SpotifyClient].
@ProviderFor(SpotifyClient)
final spotifyClientProvider =
    AutoDisposeNotifierProvider<SpotifyClient, SpotifyApiCredentials>.internal(
  SpotifyClient.new,
  name: r'spotifyClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spotifyClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SpotifyClient = AutoDisposeNotifier<SpotifyApiCredentials>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
