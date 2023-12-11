// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ratingRepositoryHash() => r'97a67e269e04cf27771cf008b27af18802f103a5';

/// See also [ratingRepository].
@ProviderFor(ratingRepository)
final ratingRepositoryProvider = AutoDisposeProvider<RatingRepository>.internal(
  ratingRepository,
  name: r'ratingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RatingRepositoryRef = AutoDisposeProviderRef<RatingRepository>;
String _$ratingUsecaseHash() => r'c513309355b931d431f0009c4e8bdc322b9cc527';

/// See also [ratingUsecase].
@ProviderFor(ratingUsecase)
final ratingUsecaseProvider = AutoDisposeProvider<RatingUsecase>.internal(
  ratingUsecase,
  name: r'ratingUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RatingUsecaseRef = AutoDisposeProviderRef<RatingUsecase>;
String _$ratingControllerHash() => r'ab04214eecc4188452bbcd92ef7a1c33ee22a4c5';

/// See also [ratingController].
@ProviderFor(ratingController)
final ratingControllerProvider =
    AutoDisposeProvider<RatingUsecaseController>.internal(
  ratingController,
  name: r'ratingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RatingControllerRef = AutoDisposeProviderRef<RatingUsecaseController>;
String _$getUserRatingsHash() => r'c5036d12e3e7e2cf736d8c3e1fafb22277e11217';

/// See also [getUserRatings].
@ProviderFor(getUserRatings)
final getUserRatingsProvider =
    AutoDisposeFutureProvider<List<RatingEntity>>.internal(
  getUserRatings,
  name: r'getUserRatingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserRatingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserRatingsRef = AutoDisposeFutureProviderRef<List<RatingEntity>>;
String _$userRatingsHash() => r'495180916b7b765ed52dd0f0e4b27c38119766b5';

/// See also [userRatings].
@ProviderFor(userRatings)
final userRatingsProvider =
    AutoDisposeFutureProvider<List<RatingEntity>>.internal(
  userRatings,
  name: r'userRatingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRatingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRatingsRef = AutoDisposeFutureProviderRef<List<RatingEntity>>;
String _$ratingHandlerHash() => r'223ea4b1fbcc8a413b40964f67dbba348b4fd55d';

/// See also [RatingHandler].
@ProviderFor(RatingHandler)
final ratingHandlerProvider =
    AutoDisposeAsyncNotifierProvider<RatingHandler, void>.internal(
  RatingHandler.new,
  name: r'ratingHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RatingHandler = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
