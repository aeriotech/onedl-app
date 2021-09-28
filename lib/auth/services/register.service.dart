import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/models/register.dto.dart';
import 'package:fundl_app/config/api.config.dart';

class LoginService {
  static Future<User> register(RegisterDto registerDto) async {
    try {
      final response = await API.client.post<User>(
        '/user',
        data: registerDto,
      );
      if (response.data != null) {
        throw Exception('Error');
      }
      return response.data!;
    } catch (e) {
      throw Exception('Error');
    }
  }
}
