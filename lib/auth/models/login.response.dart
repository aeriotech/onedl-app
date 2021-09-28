import 'package:json_annotation/json_annotation.dart';

part 'login.response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    required this.accessToken,
  });

  final String accessToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
