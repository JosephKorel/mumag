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
String _$suggestionHandlerHash() => r'b53c36fc79ef188632b89754fb81a6f8697a68bb';

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
