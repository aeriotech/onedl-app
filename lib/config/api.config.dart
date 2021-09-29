import 'package:dio/dio.dart';

const apiUrl = 'http://localhost:4000';

class API {
  static Dio client = Dio(
    BaseOptions(
      baseUrl: apiUrl,
    ),
  );
}
