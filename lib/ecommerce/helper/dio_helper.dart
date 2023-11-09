import 'package:dio/dio.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';

import 'api_url.dart';
import 'interceptors.dart';

class DioHelper {
  static Dio? _dio;
  static String token = HiveHelper.getToken();
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    if (token.isNotEmpty) "Authorization": token,
  };

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      headers: headers,
    ));
    _dio!.interceptors.add(AuthInterceptor());

    _dio!.interceptors.add(LoggingInterceptor());

    _dio!.interceptors.add(AdapterInterceptor());
  }

  ///Get Data
  Future<Response> getData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio!.get(path, data: body);

    return response;
  }

  /// Post Data
  Future<Response> postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response =
        await _dio!.post(path, data: body, queryParameters: queryParams);

    return response;
  }

  /// Put
  /// Patch
}
