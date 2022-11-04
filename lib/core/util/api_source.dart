import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiSource{
  ApiSource();
  Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = 'http://192.168.29.29:8080/';
    return dio;
  }
}