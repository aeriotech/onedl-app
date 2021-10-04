import 'package:fundl_app/age_confirmation/age_confirmation.service.dart';
import 'package:fundl_app/api/models/profile.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/auth/models/login.response.dart';
import 'package:fundl_app/auth/services/auth.service.dart';
import 'package:fundl_app/user/user.service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

final client = ApiService.instance.client;
final authService = client.getService<AuthService>();
final userService = client.getService<UserService>();
final ageConfirmationService = client.getService<AgeConfirmationService>();

@JsonSerializable()
class User {
  User({
    required this.username,
    required this.email,
    required this.emailConfirmed,
    required this.ageConfirmed,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
    required this.profile,
  });

  final String username;
  final String email;
  final bool emailConfirmed;
  final bool ageConfirmed;
  final int score;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Profile? profile;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson(User instance) => _$UserToJson(instance);

  static Future<LoginResponse?> login(LoginDto loginDto) async {
    final response = await authService.login(loginDto);
    return response.body;
  }

  static Future<User> me() async {
    final response = await userService.me();
    final user = response.body;
    if (user == null) {
      throw Exception('User not found');
    }
    return user;
  }
}
