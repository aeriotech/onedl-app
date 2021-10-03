import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/forbidden.exception.dart';
import 'package:fundl_app/api/exceptions/unauthorized.exception.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/auth/models/login.response.dart';

const storage = FlutterSecureStorage();
final api = ApiService.instance;

class LoginService {
  static Future<void> login(LoginDto loginDto) async {
    try {
      final response = await api.client.post(
        '/auth',
        data: loginDto,
      );
      if (response.data == null) {
        return;
      }

      final loginResponse = LoginResponse.fromJson(response.data);

      await saveToken(loginResponse.accessToken);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          throw BadRequestException(e.message);
        case 401:
          throw UnauthorizedException(e.message);
        case 403:
          throw ForbiddenException(e.message);
        default:
          rethrow;
      }
    }
  }

  static Future<void> saveToken(String token) async {
    await storage.write(
      key: 'token',
      value: token,
    );
    loadToken(token);
  }

  static void loadToken([String? token]) async {
    if (token != null) {
      api.client.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } else {
      if (await storage.containsKey(key: 'token')) {
        token = await storage.read(key: 'token');
        api.client.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }
  }

  static Future<bool> isLoggedIn() {
    return storage.containsKey(key: 'token');
  }

  static logout() async {
    await storage.delete(key: 'token');
  }
}
