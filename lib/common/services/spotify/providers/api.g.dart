// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spotifyAuthHash() => r'2050a44168fb415417ba937c77e206229f306712';

/// See also [spotifyAuth].
@ProviderFor(spotifyAuth)
final spotifyAuthProvider = AutoDisposeProvider<SpotifyAuthController>.internal(
  spotifyAuth,
  name: r'spotifyAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spotifyAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpotifyAuthRef = AutoDisposeProviderRef<SpotifyAuthController>;
String _$spotifyApiHash() => r'9990df3ea8fa3bed7a6b4c93ce0a6026989d81a7';

/// See also [spotifyApi].
@ProviderFor(spotifyApi)
final spotifyApiProvider = AutoDisposeProvider<SpotifyApi>.internal(
  spotifyApi,
  name: r'spotifyApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spotifyApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpotifyApiRef = AutoDisposeProviderRef<SpotifyApi>;
String _$spotifyUserTokenHash() => r'a548c206b099003f228a8205c921b2caf7c4c93b';

/// See also [SpotifyUserToken].
@ProviderFor(SpotifyUserToken)
final spotifyUserTokenProvider =
    AutoDisposeNotifierProvider<SpotifyUserToken, String?>.internal(
  SpotifyUserToken.new,
  name: r'spotifyUserTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spotifyUserTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SpotifyUserToken = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
