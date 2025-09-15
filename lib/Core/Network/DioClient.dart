import 'package:dio/dio.dart';

class Dioclient {
  Dio getInstance() {
    return Dio(BaseOptions(
      baseUrl: 'http://192.168.0.106:8000/api',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
  }
}