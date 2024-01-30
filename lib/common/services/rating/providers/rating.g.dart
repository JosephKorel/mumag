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
String _$mediaRatingHash() => r'1e5955d8bed9f1549ff6829b10c7a829c2a886ec';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [mediaRating].
@ProviderFor(mediaRating)
const mediaRatingProvider = MediaRatingFamily();

/// See also [mediaRating].
class MediaRatingFamily extends Family<AsyncValue<List<RatingEntity>?>> {
  /// See also [mediaRating].
  const MediaRatingFamily();

  /// See also [mediaRating].
  MediaRatingProvider call({
    required String spotifyId,
  }) {
    return MediaRatingProvider(
      spotifyId: spotifyId,
    );
  }

  @override
  MediaRatingProvider getProviderOverride(
    covariant MediaRatingProvider provider,
  ) {
    return call(
      spotifyId: provider.spotifyId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mediaRatingProvider';
}

/// See also [mediaRating].
class MediaRatingProvider
    extends AutoDisposeFutureProvider<List<RatingEntity>?> {
  /// See also [mediaRating].
  MediaRatingProvider({
    required String spotifyId,
  }) : this._internal(
          (ref) => mediaRating(
            ref as MediaRatingRef,
            spotifyId: spotifyId,
          ),
          from: mediaRatingProvider,
          name: r'mediaRatingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mediaRatingHash,
          dependencies: MediaRatingFamily._dependencies,
          allTransitiveDependencies:
              MediaRatingFamily._allTransitiveDependencies,
          spotifyId: spotifyId,
        );

  MediaRatingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.spotifyId,
  }) : super.internal();

  final String spotifyId;

  @override
  Override overrideWith(
    FutureOr<List<RatingEntity>?> Function(MediaRatingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MediaRatingProvider._internal(
        (ref) => create(ref as MediaRatingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        spotifyId: spotifyId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RatingEntity>?> createElement() {
    return _MediaRatingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaRatingProvider && other.spotifyId == spotifyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, spotifyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MediaRatingRef on AutoDisposeFutureProviderRef<List<RatingEntity>?> {
  /// The parameter `spotifyId` of this provider.
  String get spotifyId;
}

class _MediaRatingProviderElement
    extends AutoDisposeFutureProviderElement<List<RatingEntity>?>
    with MediaRatingRef {
  _MediaRatingProviderElement(super.provider);

  @override
  String get spotifyId => (origin as MediaRatingProvider).spotifyId;
}

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
String _$rateMediaHash() => r'9ead994278e9114793149df9ee5b40bcf12845ad';

/// See also [RateMedia].
@ProviderFor(RateMedia)
final rateMediaProvider =
    AutoDisposeAsyncNotifierProvider<RateMedia, void>.internal(
  RateMedia.new,
  name: r'rateMediaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rateMediaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RateMedia = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
