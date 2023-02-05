import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dw9_delivery_app/app/core/config/env/env.dart';

import 'interceptors/interceptor_auth.dart';

class CustomDio extends DioForNative {
  late InterceptorAuth _interceptorAuth;
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _interceptorAuth = InterceptorAuth();
  }

  CustomDio auth() {
    interceptors.add(_interceptorAuth);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_interceptorAuth);
    return this;
  }
}
