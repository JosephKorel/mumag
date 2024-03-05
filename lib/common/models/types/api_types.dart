import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';

typedef ApiResult<T> = TaskEither<AppException, T>;

typedef EitherResult<T> = Either<AppException, T>;
