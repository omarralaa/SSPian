import 'package:dio/dio.dart';
import 'package:sspian/src/models/http_exception.dart';

class SSPApiService {
  static const BASE_URL = 'http://10.0.2.2:3000/api/v1';

  Dio _dio;

  Dio get httpClient => _dio;

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print(error.message);
          //throw HttpException(error.response.data['error']);
          return handler.next(error);
        },
        onRequest: (request, handler) {
          print('${request.method} | ${request.path}');
          return handler.next(request);
        },
        onResponse: (response, handler) {
          print(
              '${response.statusCode} ${response.statusMessage}');
          return handler.next(response);
        },
      ),
    );
  }

  void init() {
    _dio = Dio(
      BaseOptions(baseUrl: BASE_URL, connectTimeout: 5000, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }),
    );

    initializeInterceptors();
  }

  void setToken(String token) {
    _dio.options.headers['x-auth-token'] = token;
  }
}
