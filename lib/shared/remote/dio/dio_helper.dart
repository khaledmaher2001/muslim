import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://www.hisnmuslim.com/api/ar/husn_ar.json',
        receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    dio!.options.headers={
      "Content-Type":"application/json",
    };
    return await dio!.get(url);
  }
}
