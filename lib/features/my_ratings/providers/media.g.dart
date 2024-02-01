// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMediaHash() => r'f27c34c77427eb0b949afb40d84bcb1782a5fa49';

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

/// See also [getMedia].
@ProviderFor(getMedia)
const getMediaProvider = GetMediaFamily();

/// See also [getMedia].
class GetMediaFamily extends Family<AsyncValue<MediaEntity>> {
  /// See also [getMedia].
  const GetMediaFamily();

  /// See also [getMedia].
  GetMediaProvider call({
    required String spotifyId,
    required RatingType type,
  }) {
    return GetMediaProvider(
      spotifyId: spotifyId,
      type: type,
    );
  }

  @override
  GetMediaProvider getProviderOverride(
    covariant GetMediaProvider provider,
  ) {
    return call(
      spotifyId: provider.spotifyId,
      type: provider.type,
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
  String? get name => r'getMediaProvider';
}

/// See also [getMedia].
class GetMediaProvider extends AutoDisposeFutureProvider<MediaEntity> {
  /// See also [getMedia].
  GetMediaProvider({
    required String spotifyId,
    required RatingType type,
  }) : this._internal(
          (ref) => getMedia(
            ref as GetMediaRef,
            spotifyId: spotifyId,
            type: type,
          ),
          from: getMediaProvider,
          name: r'getMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaHash,
          dependencies: GetMediaFamily._dependencies,
          allTransitiveDependencies: GetMediaFamily._allTransitiveDependencies,
          spotifyId: spotifyId,
          type: type,
        );

  GetMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.spotifyId,
    required this.type,
  }) : super.internal();

  final String spotifyId;
  final RatingType type;

  @override
  Override overrideWith(
    FutureOr<MediaEntity> Function(GetMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaProvider._internal(
        (ref) => create(ref as GetMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        spotifyId: spotifyId,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MediaEntity> createElement() {
    return _GetMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaProvider &&
        other.spotifyId == spotifyId &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, spotifyId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaRef on AutoDisposeFutureProviderRef<MediaEntity> {
  /// The parameter `spotifyId` of this provider.
  String get spotifyId;

  /// The parameter `type` of this provider.
  RatingType get type;
}

class _GetMediaProviderElement
    extends AutoDisposeFutureProviderElement<MediaEntity> with GetMediaRef {
  _GetMediaProviderElement(super.provider);

  @override
  String get spotifyId => (origin as GetMediaProvider).spotifyId;
  @override
  RatingType get type => (origin as GetMediaProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
