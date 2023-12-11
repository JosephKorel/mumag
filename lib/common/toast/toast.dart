import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/theme/utils.dart';

final class Toast {
  const Toast({this.exception, this.successEvent});

  final AppException? exception;
  final SuccessEvent? successEvent;

  Flushbar<void> showToast(BuildContext context) {
    if (exception != null) {
      return Flushbar(
        message: exception!.errorMsg,
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        leftBarIndicatorColor: context.error,
        icon: Icon(
          Icons.error_outline,
          color: context.error,
        ),
        duration: 4.seconds,
        isDismissible: false,
        backgroundColor: context.background,
        messageColor: context.onBackground,
        animationDuration: .6.seconds,
        borderColor: context.onSurface.withOpacity(0.2),
      );
    }

    return Flushbar(
      message: successEvent!.successMsg,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      leftBarIndicatorColor: context.primary,
      icon: Icon(
        Icons.check,
        color: context.primary,
      ),
      duration: 4.seconds,
      isDismissible: false,
      backgroundColor: context.background,
      messageColor: context.onBackground,
      animationDuration: .6.seconds,
      borderColor: context.onSurface.withOpacity(0.2),
    );
  }

  Toast copyWith({
    AppException? exception,
    SuccessEvent? successEvent,
  }) {
    return Toast(
      exception: exception ?? this.exception,
      successEvent: successEvent ?? this.successEvent,
    );
  }
}
