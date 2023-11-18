// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authInstanceHash() => r'c93ae649db5649e8d3fbe9376a77c24f815cfa58';

/// See also [authInstance].
@ProviderFor(authInstance)
final authInstanceProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  authInstance,
  name: r'authInstanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthInstanceRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$authServiceHash() => r'4c67132ce7d00b9f773b81e938ac8c51c90dcb6b';

/// See also [authService].
@ProviderFor(authService)
final authServiceProvider = AutoDisposeProvider<FirebaseAuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthServiceRef = AutoDisposeProviderRef<FirebaseAuthService>;
String _$authStreamHash() => r'c63a58562d97c20778c5264f740d147f8eb5e6b9';

/// See also [authStream].
@ProviderFor(authStream)
final authStreamProvider = AutoDisposeStreamProvider<User?>.internal(
  authStream,
  name: r'authStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStreamRef = AutoDisposeStreamProviderRef<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
