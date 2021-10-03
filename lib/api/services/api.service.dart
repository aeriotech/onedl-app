import 'package:dio/dio.dart';
import 'package:fundl_app/config/services/config.service.dart';

final ConfigService configService = ConfigService.instance;

class ApiService {
  static ApiService? _instance;

  final Dio client;

  ApiService(this.client);

  static ApiService get instance {
    _instance ??= ApiService(
      Dio(
        BaseOptions(
          baseUrl: configService.config.apiUrl,
        ),
      ),
    );
    return _instance!;
  }
}
