// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'bcde81f181d45d9659164e680bc2c3e6aff66ff0';

/// See also [appTheme].
@ProviderFor(appTheme)
final appThemeProvider = AutoDisposeProvider<ThemeData>.internal(
  appTheme,
  name: r'appThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppThemeRef = AutoDisposeProviderRef<ThemeData>;
String _$dynamicColorSchemeHash() =>
    r'8841763fbeadcf63c342ae4ebef2b1c6df413fcf';

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

/// See also [dynamicColorScheme].
@ProviderFor(dynamicColorScheme)
const dynamicColorSchemeProvider = DynamicColorSchemeFamily();

/// See also [dynamicColorScheme].
class DynamicColorSchemeFamily extends Family<AsyncValue<AppColorScheme>> {
  /// See also [dynamicColorScheme].
  const DynamicColorSchemeFamily();

  /// See also [dynamicColorScheme].
  DynamicColorSchemeProvider call({
    required String? imageUrl,
  }) {
    return DynamicColorSchemeProvider(
      imageUrl: imageUrl,
    );
  }

  @override
  DynamicColorSchemeProvider getProviderOverride(
    covariant DynamicColorSchemeProvider provider,
  ) {
    return call(
      imageUrl: provider.imageUrl,
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
  String? get name => r'dynamicColorSchemeProvider';
}

/// See also [dynamicColorScheme].
class DynamicColorSchemeProvider extends FutureProvider<AppColorScheme> {
  /// See also [dynamicColorScheme].
  DynamicColorSchemeProvider({
    required String? imageUrl,
  }) : this._internal(
          (ref) => dynamicColorScheme(
            ref as DynamicColorSchemeRef,
            imageUrl: imageUrl,
          ),
          from: dynamicColorSchemeProvider,
          name: r'dynamicColorSchemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dynamicColorSchemeHash,
          dependencies: DynamicColorSchemeFamily._dependencies,
          allTransitiveDependencies:
              DynamicColorSchemeFamily._allTransitiveDependencies,
          imageUrl: imageUrl,
        );

  DynamicColorSchemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageUrl,
  }) : super.internal();

  final String? imageUrl;

  @override
  Override overrideWith(
    FutureOr<AppColorScheme> Function(DynamicColorSchemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DynamicColorSchemeProvider._internal(
        (ref) => create(ref as DynamicColorSchemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageUrl: imageUrl,
      ),
    );
  }

  @override
  FutureProviderElement<AppColorScheme> createElement() {
    return _DynamicColorSchemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DynamicColorSchemeProvider && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DynamicColorSchemeRef on FutureProviderRef<AppColorScheme> {
  /// The parameter `imageUrl` of this provider.
  String? get imageUrl;
}

class _DynamicColorSchemeProviderElement
    extends FutureProviderElement<AppColorScheme> with DynamicColorSchemeRef {
  _DynamicColorSchemeProviderElement(super.provider);

  @override
  String? get imageUrl => (origin as DynamicColorSchemeProvider).imageUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
