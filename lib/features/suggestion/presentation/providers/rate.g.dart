// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$handleRatingHash() => r'09fe587ccf0f4dec421c5f56e2ef4d13e9398aa4';

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

/// See also [handleRating].
@ProviderFor(handleRating)
const handleRatingProvider = HandleRatingFamily();

/// See also [handleRating].
class HandleRatingFamily extends Family<AsyncValue<bool>> {
  /// See also [handleRating].
  const HandleRatingFamily();

  /// See also [handleRating].
  HandleRatingProvider call({
    required int rateValue,
  }) {
    return HandleRatingProvider(
      rateValue: rateValue,
    );
  }

  @override
  HandleRatingProvider getProviderOverride(
    covariant HandleRatingProvider provider,
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
  String? get name => r'handleRatingProvider';
}

/// See also [handleRating].
class HandleRatingProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [handleRating].
  HandleRatingProvider({
    required int rateValue,
  }) : this._internal(
          (ref) => handleRating(
            ref as HandleRatingRef,
            rateValue: rateValue,
          ),
          from: handleRatingProvider,
          name: r'handleRatingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$handleRatingHash,
          dependencies: HandleRatingFamily._dependencies,
          allTransitiveDependencies:
              HandleRatingFamily._allTransitiveDependencies,
          rateValue: rateValue,
        );

  HandleRatingProvider._internal(
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
    FutureOr<bool> Function(HandleRatingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HandleRatingProvider._internal(
        (ref) => create(ref as HandleRatingRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _HandleRatingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HandleRatingProvider && other.rateValue == rateValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rateValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HandleRatingRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `rateValue` of this provider.
  int get rateValue;
}

class _HandleRatingProviderElement
    extends AutoDisposeFutureProviderElement<bool> with HandleRatingRef {
  _HandleRatingProviderElement(super.provider);

  @override
  int get rateValue => (origin as HandleRatingProvider).rateValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
