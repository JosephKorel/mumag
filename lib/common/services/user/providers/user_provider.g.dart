// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userApiHash() => r'4fa24338fbfeb5055979d3cc53d2c4162ab7375e';

/// See also [userApi].
@ProviderFor(userApi)
final userApiProvider = AutoDisposeProvider<UserApiUsecaseRepository>.internal(
  userApi,
  name: r'userApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserApiRef = AutoDisposeProviderRef<UserApiUsecaseRepository>;
String _$userApiUsecaseHash() => r'9ed036851bb8c0288fbe0e2fa1dd9f586826ffe0';

/// See also [userApiUsecase].
@ProviderFor(userApiUsecase)
final userApiUsecaseProvider = AutoDisposeProvider<UserApiUsecase>.internal(
  userApiUsecase,
  name: r'userApiUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userApiUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserApiUsecaseRef = AutoDisposeProviderRef<UserApiUsecase>;
String _$userHash() => r'd2b1155a3877a555f763f5488ab4ed60c2771438';

/// See also [User].
@ProviderFor(User)
final userProvider =
    AutoDisposeAsyncNotifierProvider<User, UserEntity?>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = AutoDisposeAsyncNotifier<UserEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
