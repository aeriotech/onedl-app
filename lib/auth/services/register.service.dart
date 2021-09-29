import 'package:dio/dio.dart';
import 'package:fundl_app/api/exceptions/conflict.exception.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/models/register.dto.dart';
import 'package:fundl_app/config/api.config.dart';

class RegisterService {
  static Future<User> register(RegisterDto registerDto) async {
    try {
      final response = await API.client.post(
        '/user',
        data: registerDto,
      );

      final user = User.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 409:
          throw ConflictException(e.response?.data['message']);
        default:
          rethrow;
      }
    }
  }
}
