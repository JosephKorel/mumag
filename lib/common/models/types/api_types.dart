import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';

typedef ApiResult<T> = Future<Either<AppException, T>>;
