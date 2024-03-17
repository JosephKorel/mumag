// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_songs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$songsParamsHash() => r'9d4199f5f1a15fe2ed514d1aab810e75ddaf7d73';

/// See also [songsParams].
@ProviderFor(songsParams)
final songsParamsProvider = AutoDisposeProvider<FavoriteParams>.internal(
  songsParams,
  name: r'songsParamsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$songsParamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SongsParamsRef = AutoDisposeProviderRef<FavoriteParams>;
String _$favDatasourceHash() => r'28044d28c1c8fde27f923b29285f54766ed54529';

/// See also [favDatasource].
@ProviderFor(favDatasource)
final favDatasourceProvider = AutoDisposeProvider<FavoriteDatasource>.internal(
  favDatasource,
  name: r'favDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavDatasourceRef = AutoDisposeProviderRef<FavoriteDatasource>;
String _$favSongsImplHash() => r'41f698524458c873de907958f58c8693a24e47eb';

/// See also [favSongsImpl].
@ProviderFor(favSongsImpl)
final favSongsImplProvider = AutoDisposeProvider<FavoritesRepository>.internal(
  favSongsImpl,
  name: r'favSongsImplProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favSongsImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavSongsImplRef = AutoDisposeProviderRef<FavoritesRepository>;
String _$songsUsecaseHash() => r'03bfc54fd6ed5a9402f7e06434222eb4546f6715';

/// See also [songsUsecase].
@ProviderFor(songsUsecase)
final songsUsecaseProvider = AutoDisposeProvider<FavoriteSongUsecase>.internal(
  songsUsecase,
  name: r'songsUsecaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$songsUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SongsUsecaseRef = AutoDisposeProviderRef<FavoriteSongUsecase>;
String _$localFavSongsHash() => r'1dfbc51f91acab3d7abb4aa6bacf38f768d599c9';

/// See also [localFavSongs].
@ProviderFor(localFavSongs)
final localFavSongsProvider = AutoDisposeProvider<LocalFavoriteSongs>.internal(
  localFavSongs,
  name: r'localFavSongsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localFavSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalFavSongsRef = AutoDisposeProviderRef<LocalFavoriteSongs>;
String _$userSongsHash() => r'6630d6704831973e8d6ac437cdfa64526750ebbd';

/// See also [userSongs].
@ProviderFor(userSongs)
final userSongsProvider = AutoDisposeProvider<List<SingleTrack>>.internal(
  userSongs,
  name: r'userSongsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserSongsRef = AutoDisposeProviderRef<List<SingleTrack>>;
String _$saveSongsHash() => r'81aaed1ea0208aed111f7e6d47cf353d8fcd7c0a';

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

/// See also [saveSongs].
@ProviderFor(saveSongs)
const saveSongsProvider = SaveSongsFamily();

/// See also [saveSongs].
class SaveSongsFamily extends Family<AsyncValue<bool>> {
  /// See also [saveSongs].
  const SaveSongsFamily();

  /// See also [saveSongs].
  SaveSongsProvider call({
    required List<SingleTrack> songs,
  }) {
    return SaveSongsProvider(
      songs: songs,
    );
  }

  @override
  SaveSongsProvider getProviderOverride(
    covariant SaveSongsProvider provider,
  ) {
    return call(
      songs: provider.songs,
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
  String? get name => r'saveSongsProvider';
}

/// See also [saveSongs].
class SaveSongsProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [saveSongs].
  SaveSongsProvider({
    required List<SingleTrack> songs,
  }) : this._internal(
          (ref) => saveSongs(
            ref as SaveSongsRef,
            songs: songs,
          ),
          from: saveSongsProvider,
          name: r'saveSongsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveSongsHash,
          dependencies: SaveSongsFamily._dependencies,
          allTransitiveDependencies: SaveSongsFamily._allTransitiveDependencies,
          songs: songs,
        );

  SaveSongsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.songs,
  }) : super.internal();

  final List<SingleTrack> songs;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SaveSongsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveSongsProvider._internal(
        (ref) => create(ref as SaveSongsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        songs: songs,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SaveSongsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveSongsProvider && other.songs == songs;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, songs.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveSongsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `songs` of this provider.
  List<SingleTrack> get songs;
}

class _SaveSongsProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SaveSongsRef {
  _SaveSongsProviderElement(super.provider);

  @override
  List<SingleTrack> get songs => (origin as SaveSongsProvider).songs;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
