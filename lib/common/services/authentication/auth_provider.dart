import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class IsAuth extends _$IsAuth {
  @override
  FutureOr<bool> build() {
    return false;
  }

  void trigger() {
    state = AsyncValue.data(!state.requireValue);
  }
}
