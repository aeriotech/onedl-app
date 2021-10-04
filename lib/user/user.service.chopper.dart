// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserService extends UserService {
  _$UserService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserService;

  @override
  Future<Response<User>> me() {
    final $url = '/user/me';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> register(RegisterDto registerDto) {
    final $url = '/user';
    final $body = registerDto;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<User, User>($request);
  }
}
