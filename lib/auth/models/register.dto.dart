import 'package:json_annotation/json_annotation.dart';

part 'register.dto.g.dart';

@JsonSerializable()
class RegisterDto {
  RegisterDto({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}
