import 'package:json_annotation/json_annotation.dart';

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
  });

  final String username;
  final String email;
  final bool emailConfirmed;
  final bool ageConfirmed;
  final int score;
  final DateTime createdAt;
  final DateTime updatedAt;
}
