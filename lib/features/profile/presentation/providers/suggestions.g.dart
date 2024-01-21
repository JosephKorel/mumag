// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserSuggestionsHash() =>
    r'bf5c2460864c7a17efe17fd93456d1bfd624ad7f';

/// See also [fetchUserSuggestions].
@ProviderFor(fetchUserSuggestions)
final fetchUserSuggestionsProvider = AutoDisposeFutureProvider<void>.internal(
  fetchUserSuggestions,
  name: r'fetchUserSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchUserSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchUserSuggestionsRef = AutoDisposeFutureProviderRef<void>;
String _$userSuggestionsHash() => r'd2c58c363d1c850a29a04a620dec93d4aa9b399a';

/// See also [userSuggestions].
@ProviderFor(userSuggestions)
final userSuggestionsProvider =
    AutoDisposeProvider<List<SuggestionEntity>>.internal(
  userSuggestions,
  name: r'userSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserSuggestionsRef = AutoDisposeProviderRef<List<SuggestionEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
