import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/unauthorized.exception.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/auth/models/login.response.dart';
import 'package:fundl_app/config/api.config.dart';

const storage = FlutterSecureStorage();

class LoginService {
  static Future<void> login(LoginDto loginDto) async {
    try {
      final response = await API.client.post(
        '/auth',
        data: loginDto,
      );
      if (response.data == null) {
        return;
      }

      final loginResponse = LoginResponse.fromJson(response.data);

      await storage.write(
        key: 'token',
        value: loginResponse.accessToken,
      );
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          throw BadRequestException(e.message);
        case 401:
          throw UnauthorizedException(e.message);
        default:
          throw HttpException(e.message);
      }
    }
  }

  static void saveToken(String token) async {
    await storage.write(
      key: 'token',
      value: token,
    );
    loadToken(token);
  }

  static void loadToken([String? token]) async {
    if (token != null) {
      API.client.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } else {
      if (await storage.containsKey(key: 'token')) {
        token = await storage.read(key: 'token');
        API.client.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }
  }

  static Future<bool> isLoggedIn() {
    return storage.containsKey(key: 'token');
  }
}
