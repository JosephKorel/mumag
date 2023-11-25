import 'package:mumag/common/services/authentication/domain/auth_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class AuthStateController extends _$AuthStateController {
  @override
  AuthState build() {
    return Loading();
  }

  void updateState(AuthState authState) => state = authState;
}
