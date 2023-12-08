class AppException implements Exception {

  AppException(this.message);
  String? message;

  @override
  String toString() {
    message ??= message;
    return message!;
  }
}
