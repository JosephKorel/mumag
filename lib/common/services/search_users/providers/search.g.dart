// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchUsersImplHash() => r'ced36bb077bbe55e048b332c9502e0121c641c10';

/// See also [searchUsersImpl].
@ProviderFor(searchUsersImpl)
final searchUsersImplProvider =
    AutoDisposeProvider<SearchUsersImplementation>.internal(
  searchUsersImpl,
  name: r'searchUsersImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchUsersImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchUsersImplRef = AutoDisposeProviderRef<SearchUsersImplementation>;
String _$searchUsersUsecaseHash() =>
    r'68d1421252fee14e85c7d0840348752afa01f67a';

/// See also [searchUsersUsecase].
@ProviderFor(searchUsersUsecase)
final searchUsersUsecaseProvider =
    AutoDisposeProvider<SearchUsersUsecase>.internal(
  searchUsersUsecase,
  name: r'searchUsersUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchUsersUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchUsersUsecaseRef = AutoDisposeProviderRef<SearchUsersUsecase>;
String _$searchResultHash() => r'cc72f5a639cdc8a46aac4603bb7a9eecdc24ccb8';

/// See also [searchResult].
@ProviderFor(searchResult)
final searchResultProvider = AutoDisposeFutureProvider<
    Either<AppException, List<SocialUserSimple>>>.internal(
  searchResult,
  name: r'searchResultProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchResultHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchResultRef = AutoDisposeFutureProviderRef<
    Either<AppException, List<SocialUserSimple>>>;
String _$searchValueHash() => r'5011e951db2a28e37add2378c87f922b22dca918';

/// See also [SearchValue].
@ProviderFor(SearchValue)
final searchValueProvider =
    AutoDisposeNotifierProvider<SearchValue, String>.internal(
  SearchValue.new,
  name: r'searchValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchValue = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
