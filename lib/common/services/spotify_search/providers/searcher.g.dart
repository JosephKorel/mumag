// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spotifySearcherHash() => r'ceb7f72424ec09548271e6cba0a46a1d866b995c';

/// See also [spotifySearcher].
@ProviderFor(spotifySearcher)
final spotifySearcherProvider =
    AutoDisposeProvider<SpotifySearchUsecase>.internal(
  spotifySearcher,
  name: r'spotifySearcherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spotifySearcherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpotifySearcherRef = AutoDisposeProviderRef<SpotifySearchUsecase>;
String _$handleSearchHash() => r'65c9076c52d61f78cc90506a54760802be12da5f';

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

/// See also [handleSearch].
@ProviderFor(handleSearch)
const handleSearchProvider = HandleSearchFamily();

/// See also [handleSearch].
class HandleSearchFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [handleSearch].
  const HandleSearchFamily();

  /// See also [handleSearch].
  HandleSearchProvider call({
    required SpotifySearchParams params,
  }) {
    return HandleSearchProvider(
      params: params,
    );
  }

  @override
  HandleSearchProvider getProviderOverride(
    covariant HandleSearchProvider provider,
  ) {
    return call(
      params: provider.params,
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
  String? get name => r'handleSearchProvider';
}

/// See also [handleSearch].
class HandleSearchProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [handleSearch].
  HandleSearchProvider({
    required SpotifySearchParams params,
  }) : this._internal(
          (ref) => handleSearch(
            ref as HandleSearchRef,
            params: params,
          ),
          from: handleSearchProvider,
          name: r'handleSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$handleSearchHash,
          dependencies: HandleSearchFamily._dependencies,
          allTransitiveDependencies:
              HandleSearchFamily._allTransitiveDependencies,
          params: params,
        );

  HandleSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SpotifySearchParams params;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(HandleSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HandleSearchProvider._internal(
        (ref) => create(ref as HandleSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _HandleSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HandleSearchProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HandleSearchRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `params` of this provider.
  SpotifySearchParams get params;
}

class _HandleSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with HandleSearchRef {
  _HandleSearchProviderElement(super.provider);

  @override
  SpotifySearchParams get params => (origin as HandleSearchProvider).params;
}

String _$searchParamsHash() => r'4320a4d4a4f8114a2da1745ee3132f61c2f09416';

abstract class _$SearchParams
    extends BuildlessAutoDisposeNotifier<SpotifySearchParams> {
  late final SpotifySearchParams params;

  SpotifySearchParams build({
    required SpotifySearchParams params,
  });
}

/// See also [SearchParams].
@ProviderFor(SearchParams)
const searchParamsProvider = SearchParamsFamily();

/// See also [SearchParams].
class SearchParamsFamily extends Family<SpotifySearchParams> {
  /// See also [SearchParams].
  const SearchParamsFamily();

  /// See also [SearchParams].
  SearchParamsProvider call({
    required SpotifySearchParams params,
  }) {
    return SearchParamsProvider(
      params: params,
    );
  }

  @override
  SearchParamsProvider getProviderOverride(
    covariant SearchParamsProvider provider,
  ) {
    return call(
      params: provider.params,
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
  String? get name => r'searchParamsProvider';
}

/// See also [SearchParams].
class SearchParamsProvider
    extends AutoDisposeNotifierProviderImpl<SearchParams, SpotifySearchParams> {
  /// See also [SearchParams].
  SearchParamsProvider({
    required SpotifySearchParams params,
  }) : this._internal(
          () => SearchParams()..params = params,
          from: searchParamsProvider,
          name: r'searchParamsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchParamsHash,
          dependencies: SearchParamsFamily._dependencies,
          allTransitiveDependencies:
              SearchParamsFamily._allTransitiveDependencies,
          params: params,
        );

  SearchParamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final SpotifySearchParams params;

  @override
  SpotifySearchParams runNotifierBuild(
    covariant SearchParams notifier,
  ) {
    return notifier.build(
      params: params,
    );
  }

  @override
  Override overrideWith(SearchParams Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchParamsProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SearchParams, SpotifySearchParams>
      createElement() {
    return _SearchParamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchParamsProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchParamsRef on AutoDisposeNotifierProviderRef<SpotifySearchParams> {
  /// The parameter `params` of this provider.
  SpotifySearchParams get params;
}

class _SearchParamsProviderElement extends AutoDisposeNotifierProviderElement<
    SearchParams, SpotifySearchParams> with SearchParamsRef {
  _SearchParamsProviderElement(super.provider);

  @override
  SpotifySearchParams get params => (origin as SearchParamsProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
