import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'app_exception.dart';
import 'network_exception.dart';

extension FutureSafeAsync<T> on Future<T> {
  Future<T> safeAsync() async {
    final connected = await checkNetworkAvailable();
    if (!connected) {
      return Future.error(NoNetworkException());
    }
    try {
      final response = await this;
      return response;
    } catch (e) {
      if (e is DioError && _isNetWorkError(e)) {
        return Future.error(NoNetworkException());
      }
      return Future.error(
        AppException(
          'Error',
          'Some thing went wrong',
        ),
      );
    }
  }
}

bool _isNetWorkError(DioError error) {
  final errorType = error.type;
  switch (errorType) {
    case DioErrorType.connectTimeout:
    case DioErrorType.receiveTimeout:
    case DioErrorType.sendTimeout:
      return true;
    default:
      return false;
  }
}

Future<bool> checkNetworkAvailable() async {
  Connectivity connectivity = Connectivity();
  ConnectivityResult status = await connectivity.checkConnectivity();
  switch (status) {
    case ConnectivityResult.wifi:
    case ConnectivityResult.mobile:
      return true;
    case ConnectivityResult.none:
      return false;
    default:
      return false;
  }
}
