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
}
