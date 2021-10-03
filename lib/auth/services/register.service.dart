import 'package:dio/dio.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/conflict.exception.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/models/register.dto.dart';

class RegisterService {
  static Future<User> register(RegisterDto registerDto) async {
    try {
      final response = await api.client.post(
        '/user',
        data: registerDto,
      );

      final user = User.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          throw BadRequestException(e.message);
        case 409:
          throw ConflictException(e.response?.data['message']);
        default:
          rethrow;
      }
    }
  }
}
