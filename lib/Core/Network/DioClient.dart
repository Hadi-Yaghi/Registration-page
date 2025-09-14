import 'package:dio/dio.dart';

class Dioclient {
  Dio getInstance() {
    return Dio(BaseOptions(
      baseUrl: 'https://reqres.in/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
  }
}