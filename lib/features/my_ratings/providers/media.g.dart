// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMediaListHash() => r'a56db5e3a41bb35e1f03990da4dce216f4b6fbbe';

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

/// See also [getMediaList].
@ProviderFor(getMediaList)
const getMediaListProvider = GetMediaListFamily();

/// See also [getMediaList].
class GetMediaListFamily extends Family<AsyncValue<List<MediaEntity>>> {
  /// See also [getMediaList].
  const GetMediaListFamily();

  /// See also [getMediaList].
  GetMediaListProvider call({
    required List<RatingEntity> ratings,
  }) {
    return GetMediaListProvider(
      ratings: ratings,
    );
  }

  @override
  GetMediaListProvider getProviderOverride(
    covariant GetMediaListProvider provider,
  ) {
    return call(
      ratings: provider.ratings,
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
  String? get name => r'getMediaListProvider';
}

/// See also [getMediaList].
class GetMediaListProvider
    extends AutoDisposeFutureProvider<List<MediaEntity>> {
  /// See also [getMediaList].
  GetMediaListProvider({
    required List<RatingEntity> ratings,
  }) : this._internal(
          (ref) => getMediaList(
            ref as GetMediaListRef,
            ratings: ratings,
          ),
          from: getMediaListProvider,
          name: r'getMediaListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaListHash,
          dependencies: GetMediaListFamily._dependencies,
          allTransitiveDependencies:
              GetMediaListFamily._allTransitiveDependencies,
          ratings: ratings,
        );

  GetMediaListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ratings,
  }) : super.internal();

  final List<RatingEntity> ratings;

  @override
  Override overrideWith(
    FutureOr<List<MediaEntity>> Function(GetMediaListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaListProvider._internal(
        (ref) => create(ref as GetMediaListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ratings: ratings,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MediaEntity>> createElement() {
    return _GetMediaListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaListProvider && other.ratings == ratings;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ratings.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaListRef on AutoDisposeFutureProviderRef<List<MediaEntity>> {
  /// The parameter `ratings` of this provider.
  List<RatingEntity> get ratings;
}

class _GetMediaListProviderElement
    extends AutoDisposeFutureProviderElement<List<MediaEntity>>
    with GetMediaListRef {
  _GetMediaListProviderElement(super.provider);

  @override
  List<RatingEntity> get ratings => (origin as GetMediaListProvider).ratings;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
