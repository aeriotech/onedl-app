import 'package:dio/dio.dart';

const apiUrl = 'https://api.fundl.io';

class API {
  static Dio client = Dio(
    BaseOptions(
      baseUrl: apiUrl,
    ),
  );
}
