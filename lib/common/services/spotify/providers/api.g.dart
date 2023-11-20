// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientCredentialsHash() => r'6ee86227e4f694096fa7e897504e631078c64315';

/// See also [clientCredentials].
@ProviderFor(clientCredentials)
final clientCredentialsProvider =
    AutoDisposeProvider<SpotifyApiCredentials>.internal(
  clientCredentials,
  name: r'clientCredentialsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clientCredentialsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientCredentialsRef = AutoDisposeProviderRef<SpotifyApiCredentials>;
String _$spotifyAuthHash() => r'5343faf5765781e99c90a6161c7cf7952cb11fb6';

/// See also [spotifyAuth].
@ProviderFor(spotifyAuth)
final spotifyAuthProvider = AutoDisposeProvider<SpotifyAuth>.internal(
  spotifyAuth,
  name: r'spotifyAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spotifyAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpotifyAuthRef = AutoDisposeProviderRef<SpotifyAuth>;
String _$spotifyClientHash() => r'1bcbc48dd4bb2b4c74c597a1595a416671941b21';

/// See also [spotifyClient].
@ProviderFor(spotifyClient)
final spotifyClientProvider = AutoDisposeProvider<SpotifyApi>.internal(
  spotifyClient,
  name: r'spotifyClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spotifyClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpotifyClientRef = AutoDisposeProviderRef<SpotifyApi>;
String _$linkListenerHash() => r'bb46bdefdbeace8d8faa83a4516dfaa4bd0a1a28';

/// See also [linkListener].
@ProviderFor(linkListener)
final linkListenerProvider =
    AutoDisposeProvider<StreamSubscription<Uri?>>.internal(
  linkListener,
  name: r'linkListenerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$linkListenerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LinkListenerRef = AutoDisposeProviderRef<StreamSubscription<Uri?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
