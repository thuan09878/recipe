class AppException implements Exception {
  String title;
  String message;

  AppException(this.title, this.message);

  @override
  String toString() => '$title $message';
}