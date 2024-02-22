// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$suggestionRepositoryHash() =>
    r'177b7f385b7482f3ba78db6dad959e7274dfbb8b';

/// See also [suggestionRepository].
@ProviderFor(suggestionRepository)
final suggestionRepositoryProvider =
    AutoDisposeProvider<SuggestionRepository>.internal(
  suggestionRepository,
  name: r'suggestionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$suggestionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SuggestionRepositoryRef = AutoDisposeProviderRef<SuggestionRepository>;
String _$suggestionUsecaseHash() => r'd3dfba9562f4b06f73475c2400c728689a7b3e46';

/// See also [suggestionUsecase].
@ProviderFor(suggestionUsecase)
final suggestionUsecaseProvider =
    AutoDisposeProvider<SuggestionUsecase>.internal(
  suggestionUsecase,
  name: r'suggestionUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$suggestionUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SuggestionUsecaseRef = AutoDisposeProviderRef<SuggestionUsecase>;
String _$suggestionControllerHash() =>
    r'b1ee03cd3a3436ec5693e0dbb02fb6d977a1130e';

/// See also [suggestionController].
@ProviderFor(suggestionController)
final suggestionControllerProvider =
    AutoDisposeProvider<SuggestionUsecaseController>.internal(
  suggestionController,
  name: r'suggestionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$suggestionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SuggestionControllerRef
    = AutoDisposeProviderRef<SuggestionUsecaseController>;
String _$sendSuggestionHash() => r'17f91dcfe881d475d892fd4d1401c946d922e17c';

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

/// See also [sendSuggestion].
@ProviderFor(sendSuggestion)
const sendSuggestionProvider = SendSuggestionFamily();

/// See also [sendSuggestion].
class SendSuggestionFamily extends Family<AsyncValue<bool>> {
  /// See also [sendSuggestion].
  const SendSuggestionFamily();

  /// See also [sendSuggestion].
  SendSuggestionProvider call({
    required InsertSuggestionParams event,
  }) {
    return SendSuggestionProvider(
      event: event,
    );
  }

  @override
  SendSuggestionProvider getProviderOverride(
    covariant SendSuggestionProvider provider,
  ) {
    return call(
      event: provider.event,
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
  String? get name => r'sendSuggestionProvider';
}

/// See also [sendSuggestion].
class SendSuggestionProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [sendSuggestion].
  SendSuggestionProvider({
    required InsertSuggestionParams event,
  }) : this._internal(
          (ref) => sendSuggestion(
            ref as SendSuggestionRef,
            event: event,
          ),
          from: sendSuggestionProvider,
          name: r'sendSuggestionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendSuggestionHash,
          dependencies: SendSuggestionFamily._dependencies,
          allTransitiveDependencies:
              SendSuggestionFamily._allTransitiveDependencies,
          event: event,
        );

  SendSuggestionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.event,
  }) : super.internal();

  final InsertSuggestionParams event;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SendSuggestionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendSuggestionProvider._internal(
        (ref) => create(ref as SendSuggestionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        event: event,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SendSuggestionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendSuggestionProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendSuggestionRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `event` of this provider.
  InsertSuggestionParams get event;
}

class _SendSuggestionProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SendSuggestionRef {
  _SendSuggestionProviderElement(super.provider);

  @override
  InsertSuggestionParams get event => (origin as SendSuggestionProvider).event;
}

String _$sendManySuggestionsHash() =>
    r'adb692a1609a838b001e0dfb5829e2c77ee0e104';

/// See also [sendManySuggestions].
@ProviderFor(sendManySuggestions)
const sendManySuggestionsProvider = SendManySuggestionsFamily();

/// See also [sendManySuggestions].
class SendManySuggestionsFamily extends Family<AsyncValue<bool>> {
  /// See also [sendManySuggestions].
  const SendManySuggestionsFamily();

  /// See also [sendManySuggestions].
  SendManySuggestionsProvider call({
    required InsertManySuggestionsParams event,
  }) {
    return SendManySuggestionsProvider(
      event: event,
    );
  }

  @override
  SendManySuggestionsProvider getProviderOverride(
    covariant SendManySuggestionsProvider provider,
  ) {
    return call(
      event: provider.event,
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
  String? get name => r'sendManySuggestionsProvider';
}

/// See also [sendManySuggestions].
class SendManySuggestionsProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [sendManySuggestions].
  SendManySuggestionsProvider({
    required InsertManySuggestionsParams event,
  }) : this._internal(
          (ref) => sendManySuggestions(
            ref as SendManySuggestionsRef,
            event: event,
          ),
          from: sendManySuggestionsProvider,
          name: r'sendManySuggestionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendManySuggestionsHash,
          dependencies: SendManySuggestionsFamily._dependencies,
          allTransitiveDependencies:
              SendManySuggestionsFamily._allTransitiveDependencies,
          event: event,
        );

  SendManySuggestionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.event,
  }) : super.internal();

  final InsertManySuggestionsParams event;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SendManySuggestionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendManySuggestionsProvider._internal(
        (ref) => create(ref as SendManySuggestionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        event: event,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SendManySuggestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendManySuggestionsProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendManySuggestionsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `event` of this provider.
  InsertManySuggestionsParams get event;
}

class _SendManySuggestionsProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SendManySuggestionsRef {
  _SendManySuggestionsProviderElement(super.provider);

  @override
  InsertManySuggestionsParams get event =>
      (origin as SendManySuggestionsProvider).event;
}

String _$suggestionHandlerHash() => r'd29be8b27b7b5c503ad1f5c8728afa43419ea1b5';

/// See also [SuggestionHandler].
@ProviderFor(SuggestionHandler)
final suggestionHandlerProvider =
    AutoDisposeAsyncNotifierProvider<SuggestionHandler, void>.internal(
  SuggestionHandler.new,
  name: r'suggestionHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$suggestionHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SuggestionHandler = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
