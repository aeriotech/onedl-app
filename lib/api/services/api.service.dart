import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fundl_app/auth/services/auth.service.dart';
import 'package:fundl_app/config/config.service.dart';
import 'package:fundl_app/coupon/services/coupon.service.dart';
import 'package:fundl_app/post/post.service.dart';

final ConfigService configService = ConfigService.instance;
const FlutterSecureStorage storage = FlutterSecureStorage();

class ApiService {
  static ApiService? _instance;

  final ChopperClient client;

  ApiService(this.client);

  static ApiService get instance {
    _instance ??= ApiService(
      ChopperClient(
        baseUrl: configService.config.apiUrl,
        services: [
          AuthService.create(),
          CouponService.create(),
          PostService.create(),
        ],
        interceptors: [
          (Request request) async {
            final token = await storage.read(key: 'token');
            if (token != null) {
              applyHeader(request, 'authorization', token);
            }
            return request;
          },
        ],
        converter: const JsonConverter(),
      ),
    );
    return _instance!;
  }
}
