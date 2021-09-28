import 'package:json_annotation/json_annotation.dart';

part 'login.dto.g.dart';

@JsonSerializable()
class LoginDto {
  LoginDto({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}
