sealed class AppException extends Error {}

final class ApiException extends AppException {
  final String errorMsg;
  final String userMsg;

  ApiException({required this.errorMsg, required this.userMsg});
}
