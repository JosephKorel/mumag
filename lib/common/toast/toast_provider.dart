import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/toast/toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_provider.g.dart';

@riverpod
class ToastMessage extends _$ToastMessage {
  @override
  Toast build() {
    return const Toast();
  }

  void onException({required AppException exception}) =>
      state = Toast(exception: exception);

  void onSuccessEvent({required SuccessEvent successEvent}) =>
      state = Toast(successEvent: successEvent);
}
