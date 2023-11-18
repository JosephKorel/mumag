// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServiceHash() => r'a56a0385ca8cbbee4ff3ebcc22faf5e3799685fd';

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
