import 'package:dio/dio.dart';

// base url : https://newsapi.org/
// method or endpoints (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/top-headlines?apiKey=2c13eed31aa84ce38b5f01c2ddf398f0&country=us&category=business

class DioHelper{
  static Dio? dio;
  static void init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String urlMethod,
    required Map<String,dynamic> query,
})async{
    return await dio!.get(
      urlMethod, // path
      queryParameters: query,
    );
  }
}