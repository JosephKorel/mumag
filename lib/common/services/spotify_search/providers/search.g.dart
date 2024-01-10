// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spotifySearchHash() => r'ad1dfc77fb3f823f3dca87fd20d5c0d698c5f4a6';

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

/// See also [spotifySearch].
@ProviderFor(spotifySearch)
const spotifySearchProvider = SpotifySearchFamily();

/// See also [spotifySearch].
class SpotifySearchFamily extends Family<AsyncValue<String>> {
  /// See also [spotifySearch].
  const SpotifySearchFamily();

  /// See also [spotifySearch].
  SpotifySearchProvider call({
    required SearchType type,
  }) {
    return SpotifySearchProvider(
      type: type,
    );
  }

  @override
  SpotifySearchProvider getProviderOverride(
    covariant SpotifySearchProvider provider,
  ) {
    return call(
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
  String? get name => r'spotifySearchProvider';
}

/// See also [spotifySearch].
class SpotifySearchProvider extends AutoDisposeFutureProvider<String> {
  /// See also [spotifySearch].
  SpotifySearchProvider({
    required SearchType type,
  }) : this._internal(
          (ref) => spotifySearch(
            ref as SpotifySearchRef,
            type: type,
          ),
          from: spotifySearchProvider,
          name: r'spotifySearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$spotifySearchHash,
          dependencies: SpotifySearchFamily._dependencies,
          allTransitiveDependencies:
              SpotifySearchFamily._allTransitiveDependencies,
          type: type,
        );

  SpotifySearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final SearchType type;

  @override
  Override overrideWith(
    FutureOr<String> Function(SpotifySearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SpotifySearchProvider._internal(
        (ref) => create(ref as SpotifySearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _SpotifySearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpotifySearchProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SpotifySearchRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `type` of this provider.
  SearchType get type;
}

class _SpotifySearchProviderElement
    extends AutoDisposeFutureProviderElement<String> with SpotifySearchRef {
  _SpotifySearchProviderElement(super.provider);

  @override
  SearchType get type => (origin as SpotifySearchProvider).type;
}

String _$searchMediaHash() => r'ef00a1428b54277e45e211f2528c3a39eff46e49';

/// See also [SearchMedia].
@ProviderFor(SearchMedia)
final searchMediaProvider =
    AutoDisposeNotifierProvider<SearchMedia, String>.internal(
  SearchMedia.new,
  name: r'searchMediaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchMediaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchMedia = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
