// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_songs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favSongsImplHash() => r'ca45731bfaf70662b55ac78a86ae4d698af797f3';

/// See also [favSongsImpl].
@ProviderFor(favSongsImpl)
final favSongsImplProvider =
    AutoDisposeProvider<FavoriteRepositoryImpl>.internal(
  favSongsImpl,
  name: r'favSongsImplProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favSongsImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavSongsImplRef = AutoDisposeProviderRef<FavoriteRepositoryImpl>;
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
String _$songsImplHash() => r'8e919c45bac338d377ad816744e3bf2a417c9777';

/// See also [songsImpl].
@ProviderFor(songsImpl)
final songsImplProvider = AutoDisposeProvider<FavoriteRepositoryImpl>.internal(
  songsImpl,
  name: r'songsImplProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$songsImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SongsImplRef = AutoDisposeProviderRef<FavoriteRepositoryImpl>;
String _$songsRepositoryHash() => r'8a4e2b63fff96fc53992ad0c0cd7dc8b1ef88475';

/// See also [songsRepository].
@ProviderFor(songsRepository)
final songsRepositoryProvider =
    AutoDisposeProvider<FavoritesRepository>.internal(
  songsRepository,
  name: r'songsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$songsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SongsRepositoryRef = AutoDisposeProviderRef<FavoritesRepository>;
String _$songsUsecaseHash() => r'c6bf25977af0ce0ba183debd4a49f18b50ce8d45';

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
String _$userFavSongsHash() => r'b27f5523fe1db41bc45f02d6314dc76d29713fa6';

/// See also [userFavSongs].
@ProviderFor(userFavSongs)
final userFavSongsProvider =
    AutoDisposeFutureProvider<List<SingleTrack>>.internal(
  userFavSongs,
  name: r'userFavSongsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userFavSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserFavSongsRef = AutoDisposeFutureProviderRef<List<SingleTrack>>;
String _$saveSongsHash() => r'fbb68ecaace5245937359396753d55a255a0f8b5';

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
