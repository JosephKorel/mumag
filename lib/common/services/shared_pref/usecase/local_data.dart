import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocalStorageUsecase {
  LocalStorageUsecase(this._sharedPref);

  final SharedPreferences _sharedPref;

  ApiResult<void> setString({required String key, required String value}) {
    return TaskEither.tryCatch(
      () async {
        final result = await _sharedPref.setString(key, value);

        if (!result) {
          throw Exception();
        }
      },
      (error, stackTrace) =>
          ApiException(errorMsg: 'Failed to syncronize', error: error),
    );
  }

  T? getString<T>({required String key}) {
    final data = _sharedPref.getString(key);

    if (data == null) {
      return null;
    }

    return jsonDecode(data) as T;
  }

  String? getSuggestionString({required String key}) {
    return _sharedPref.getString(key);
  }
}
