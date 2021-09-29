import 'package:dio/dio.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/conflict.exception.dart';
import 'package:fundl_app/api/exceptions/not_found.exception.dart';
import 'package:fundl_app/api/models/profile.model.dart';
import 'package:fundl_app/config/api.config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

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

  static Future<User> me() async {
    final response = await API.client.get('/user/me');

    final user = User.fromJson(response.data);

    return user;
  }

  static Future<void> confirmAge(String emso) async {
    try {
      await API.client.post('/age-confirmation/emso/$emso');
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          throw BadRequestException(e.message);
        case 404:
          throw NotFoundException(e.message);
        case 409:
          throw ConflictException(e.message);
      }
      rethrow;
    }
  }
}
