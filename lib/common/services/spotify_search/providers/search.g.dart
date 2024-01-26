// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMediaByIdHash() => r'2e70fa333d826e2aabef108ec871f5c06ec6af49';

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

/// See also [searchMediaById].
@ProviderFor(searchMediaById)
const searchMediaByIdProvider = SearchMediaByIdFamily();

/// See also [searchMediaById].
class SearchMediaByIdFamily
    extends Family<AsyncValue<SuggestionWidgetEntity?>> {
  /// See also [searchMediaById].
  const SearchMediaByIdFamily();

  /// See also [searchMediaById].
  SearchMediaByIdProvider call({
    required SuggestionType type,
    required String spotifyId,
  }) {
    return SearchMediaByIdProvider(
      type: type,
      spotifyId: spotifyId,
    );
  }

  @override
  SearchMediaByIdProvider getProviderOverride(
    covariant SearchMediaByIdProvider provider,
  ) {
    return call(
      type: provider.type,
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
  String? get name => r'searchMediaByIdProvider';
}

/// See also [searchMediaById].
class SearchMediaByIdProvider
    extends AutoDisposeFutureProvider<SuggestionWidgetEntity?> {
  /// See also [searchMediaById].
  SearchMediaByIdProvider({
    required SuggestionType type,
    required String spotifyId,
  }) : this._internal(
          (ref) => searchMediaById(
            ref as SearchMediaByIdRef,
            type: type,
            spotifyId: spotifyId,
          ),
          from: searchMediaByIdProvider,
          name: r'searchMediaByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMediaByIdHash,
          dependencies: SearchMediaByIdFamily._dependencies,
          allTransitiveDependencies:
              SearchMediaByIdFamily._allTransitiveDependencies,
          type: type,
          spotifyId: spotifyId,
        );

  SearchMediaByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.spotifyId,
  }) : super.internal();

  final SuggestionType type;
  final String spotifyId;

  @override
  Override overrideWith(
    FutureOr<SuggestionWidgetEntity?> Function(SearchMediaByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchMediaByIdProvider._internal(
        (ref) => create(ref as SearchMediaByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        spotifyId: spotifyId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SuggestionWidgetEntity?> createElement() {
    return _SearchMediaByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMediaByIdProvider &&
        other.type == type &&
        other.spotifyId == spotifyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, spotifyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchMediaByIdRef
    on AutoDisposeFutureProviderRef<SuggestionWidgetEntity?> {
  /// The parameter `type` of this provider.
  SuggestionType get type;

  /// The parameter `spotifyId` of this provider.
  String get spotifyId;
}

class _SearchMediaByIdProviderElement
    extends AutoDisposeFutureProviderElement<SuggestionWidgetEntity?>
    with SearchMediaByIdRef {
  _SearchMediaByIdProviderElement(super.provider);

  @override
  SuggestionType get type => (origin as SearchMediaByIdProvider).type;
  @override
  String get spotifyId => (origin as SearchMediaByIdProvider).spotifyId;
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
String _$spotifySearchHash() => r'092295ee43f29a869facc27ce508f5916ffb1d10';

abstract class _$SpotifySearch
    extends BuildlessAutoDisposeAsyncNotifier<List<dynamic>> {
  late final SearchType? type;

  FutureOr<List<dynamic>> build({
    SearchType? type,
  });
}

/// See also [SpotifySearch].
@ProviderFor(SpotifySearch)
const spotifySearchProvider = SpotifySearchFamily();

/// See also [SpotifySearch].
class SpotifySearchFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [SpotifySearch].
  const SpotifySearchFamily();

  /// See also [SpotifySearch].
  SpotifySearchProvider call({
    SearchType? type,
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

/// See also [SpotifySearch].
class SpotifySearchProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SpotifySearch, List<dynamic>> {
  /// See also [SpotifySearch].
  SpotifySearchProvider({
    SearchType? type,
  }) : this._internal(
          () => SpotifySearch()..type = type,
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

  final SearchType? type;

  @override
  FutureOr<List<dynamic>> runNotifierBuild(
    covariant SpotifySearch notifier,
  ) {
    return notifier.build(
      type: type,
    );
  }

  @override
  Override overrideWith(SpotifySearch Function() create) {
    return ProviderOverride(
      origin: this,
      override: SpotifySearchProvider._internal(
        () => create()..type = type,
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
  AutoDisposeAsyncNotifierProviderElement<SpotifySearch, List<dynamic>>
      createElement() {
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

mixin SpotifySearchRef on AutoDisposeAsyncNotifierProviderRef<List<dynamic>> {
  /// The parameter `type` of this provider.
  SearchType? get type;
}

class _SpotifySearchProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SpotifySearch,
        List<dynamic>> with SpotifySearchRef {
  _SpotifySearchProviderElement(super.provider);

  @override
  SearchType? get type => (origin as SpotifySearchProvider).type;
}

String _$spotifyFullSearchHash() => r'4066421fa7c448362fa4a45a9b011c5bac28c94c';

/// See also [SpotifyFullSearch].
@ProviderFor(SpotifyFullSearch)
final spotifyFullSearchProvider =
    AutoDisposeAsyncNotifierProvider<SpotifyFullSearch, List<dynamic>>.internal(
  SpotifyFullSearch.new,
  name: r'spotifyFullSearchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spotifyFullSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SpotifyFullSearch = AutoDisposeAsyncNotifier<List<dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
