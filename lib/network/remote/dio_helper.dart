import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url, required Map<String, dynamic> query}) async
  {
     var response = await dio.get(
      url,
      queryParameters: query,
    );
     print('=============================================================');
     print(response.data);
     print('=============================================================');

     return response;
  }


}
