import 'package:mumag/common/models/exception/exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exception_provider.g.dart';

@riverpod
AppException exception(ExceptionRef ref) {
  return ApiException(errorMsg: '');
}
