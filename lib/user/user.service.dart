import 'package:chopper/chopper.dart';
import 'package:fundl_app/auth/models/register.dto.dart';
import 'package:fundl_app/user/user.model.dart';

part 'user.service.chopper.dart';

@ChopperApi(baseUrl: '/user')
abstract class UserService extends ChopperService {
  @Get(path: '/me')
  Future<Response<User>> me();

  @Post()
  Future<Response<User>> register(@Body() RegisterDto registerDto);
}
