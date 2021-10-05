import 'package:json_annotation/json_annotation.dart';

part 'forgot_password.dto.g.dart';

@JsonSerializable()
class ForgotPasswordDto {
  ForgotPasswordDto({
    required this.email,
  });

  final String email;

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) => _$ForgotPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordDtoToJson(this);
}
