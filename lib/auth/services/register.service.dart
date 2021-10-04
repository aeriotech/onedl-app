import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/user/user.model.dart';
import 'package:fundl_app/auth/models/register.dto.dart';
import 'package:fundl_app/user/user.service.dart';

final client = ApiService.instance.client;
final userService = client.getService<UserService>();

class RegisterService {
  static Future<User> register(RegisterDto registerDto) async {
    final response = await userService.register(registerDto);
    final registerResponse = response.body;
    if (registerResponse == null) {
      throw Exception('Error registering user');
    }
    return registerResponse;
  }
}
