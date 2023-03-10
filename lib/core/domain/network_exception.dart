import 'app_exception.dart';

class NoNetworkException extends AppException {
  NoNetworkException() : super("Error", "No network connection");
}
