import 'package:dio/dio.dart';

const apiUrl = 'http://192.168.1.164:4000';

class API {
  static Dio client = Dio(
    BaseOptions(
      baseUrl: apiUrl,
    ),
  );
}
