// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rateTrackHash() => r'25d94fa73a9fb9d83ab649cd6f58b7ad38a32946';

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

/// See also [rateTrack].
@ProviderFor(rateTrack)
const rateTrackProvider = RateTrackFamily();

/// See also [rateTrack].
class RateTrackFamily extends Family<ApiResult<void>> {
  /// See also [rateTrack].
  const RateTrackFamily();

  /// See also [rateTrack].
  RateTrackProvider call({
    required int rateValue,
  }) {
    return RateTrackProvider(
      rateValue: rateValue,
    );
  }

  @override
  RateTrackProvider getProviderOverride(
    covariant RateTrackProvider provider,
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
  String? get name => r'rateTrackProvider';
}

/// See also [rateTrack].
class RateTrackProvider extends AutoDisposeProvider<ApiResult<void>> {
  /// See also [rateTrack].
  RateTrackProvider({
    required int rateValue,
  }) : this._internal(
          (ref) => rateTrack(
            ref as RateTrackRef,
            rateValue: rateValue,
          ),
          from: rateTrackProvider,
          name: r'rateTrackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rateTrackHash,
          dependencies: RateTrackFamily._dependencies,
          allTransitiveDependencies: RateTrackFamily._allTransitiveDependencies,
          rateValue: rateValue,
        );

  RateTrackProvider._internal(
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
    ApiResult<void> Function(RateTrackRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RateTrackProvider._internal(
        (ref) => create(ref as RateTrackRef),
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
  AutoDisposeProviderElement<ApiResult<void>> createElement() {
    return _RateTrackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RateTrackProvider && other.rateValue == rateValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rateValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RateTrackRef on AutoDisposeProviderRef<ApiResult<void>> {
  /// The parameter `rateValue` of this provider.
  int get rateValue;
}

class _RateTrackProviderElement
    extends AutoDisposeProviderElement<ApiResult<void>> with RateTrackRef {
  _RateTrackProviderElement(super.provider);

  @override
  int get rateValue => (origin as RateTrackProvider).rateValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
