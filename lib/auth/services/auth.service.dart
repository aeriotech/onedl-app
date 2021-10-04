import 'package:chopper/chopper.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/auth/models/login.response.dart';

part 'auth.service.chopper.dart';

@ChopperApi(baseUrl: "/auth")
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @Post()
  Future<Response<LoginResponse>> login(@Body() LoginDto loginDto);
}
