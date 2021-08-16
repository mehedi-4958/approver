import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  dio.options.baseUrl =
      'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';
  dio.options.headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  return dio;
}

//wanted to try a different way
// import 'package:dio/dio.dart';
//
// class DioClient {
//   Dio dio = new Dio();
//   final Dio _dio = Dio();
//
//   final _baseURL = 'http://192.168.1.107/ApprovalAPI/public/index.php/api/v1';
// }
