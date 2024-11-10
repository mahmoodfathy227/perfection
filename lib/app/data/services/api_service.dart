import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://reqres.in/api/",
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    _dio = Dio(options);

    // Add Interceptors (Optional)
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add authorization token to headers
        options.headers["Authorization"] = "Bearer YOUR_TOKEN";
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // Handle errors
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      // Handle error
      throw e;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.post(path, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
      throw e;
    }
  }


}
