// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rateAlbumHash() => r'cd40a24726d323184e2d3401005e3b0f2e76ae2c';

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

/// See also [rateAlbum].
@ProviderFor(rateAlbum)
const rateAlbumProvider = RateAlbumFamily();

/// See also [rateAlbum].
class RateAlbumFamily
    extends Family<AsyncValue<Either<AppException, dynamic>>> {
  /// See also [rateAlbum].
  const RateAlbumFamily();

  /// See also [rateAlbum].
  RateAlbumProvider call({
    required int rateValue,
  }) {
    return RateAlbumProvider(
      rateValue: rateValue,
    );
  }

  @override
  RateAlbumProvider getProviderOverride(
    covariant RateAlbumProvider provider,
  ) {
    return call(
      rateValue: provider.rateValue,
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
  String? get name => r'rateAlbumProvider';
}

/// See also [rateAlbum].
class RateAlbumProvider
    extends AutoDisposeFutureProvider<Either<AppException, dynamic>> {
  /// See also [rateAlbum].
  RateAlbumProvider({
    required int rateValue,
  }) : this._internal(
          (ref) => rateAlbum(
            ref as RateAlbumRef,
            rateValue: rateValue,
          ),
          from: rateAlbumProvider,
          name: r'rateAlbumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rateAlbumHash,
          dependencies: RateAlbumFamily._dependencies,
          allTransitiveDependencies: RateAlbumFamily._allTransitiveDependencies,
          rateValue: rateValue,
        );

  RateAlbumProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rateValue,
  }) : super.internal();

  final int rateValue;

  @override
  Override overrideWith(
    FutureOr<Either<AppException, dynamic>> Function(RateAlbumRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RateAlbumProvider._internal(
        (ref) => create(ref as RateAlbumRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rateValue: rateValue,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<AppException, dynamic>>
      createElement() {
    return _RateAlbumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RateAlbumProvider && other.rateValue == rateValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rateValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RateAlbumRef
    on AutoDisposeFutureProviderRef<Either<AppException, dynamic>> {
  /// The parameter `rateValue` of this provider.
  int get rateValue;
}

class _RateAlbumProviderElement
    extends AutoDisposeFutureProviderElement<Either<AppException, dynamic>>
    with RateAlbumRef {
  _RateAlbumProviderElement(super.provider);

  @override
  int get rateValue => (origin as RateAlbumProvider).rateValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
