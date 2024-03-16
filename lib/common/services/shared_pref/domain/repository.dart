abstract interface class SharedPrefsRepository {
  String get key;

  Future<void> setString(String value) {
    throw UnimplementedError();
  }

  Future<T> getString<T>() {
    throw UnimplementedError();
  }
}
