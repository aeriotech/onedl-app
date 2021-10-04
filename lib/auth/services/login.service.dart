import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/auth/services/auth.service.dart';

const storage = FlutterSecureStorage();
final client = ApiService.instance.client;
final authService = client.getService<AuthService>();

class LoginService {
  static Future<void> login(LoginDto loginDto) async {
    final response = await authService.login(loginDto);
    final loginResponse = response.body;

    if (loginResponse == null) {
      return;
    }

    await saveToken(loginResponse.accessToken);
  }

  static Future<void> saveToken(String token) async {
    await storage.write(
      key: 'token',
      value: token,
    );
  }

  static Future<bool> isLoggedIn() {
    return storage.containsKey(key: 'token');
  }

  static logout() async {
    await storage.delete(key: 'token');
  }
}
