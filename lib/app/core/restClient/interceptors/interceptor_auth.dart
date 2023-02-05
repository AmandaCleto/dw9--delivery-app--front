import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterceptorAuth extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');

    options.headers['Authorization'] = 'Barear $accessToken';

    handler.next(options);
  }

  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      //redirecionar a login
      final sp = await SharedPreferences.getInstance();
      final accessToken = sp.clear();
      handler.next(error);
    } else {
      handler.next(error);
    }
  }
}
