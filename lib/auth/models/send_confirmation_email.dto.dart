import 'package:json_annotation/json_annotation.dart';

part 'send_confirmation_email.dto.g.dart';

@JsonSerializable()
class SendEmailConfirmationDto {
  SendEmailConfirmationDto({
    required this.email,
  });

  final String email;

  factory SendEmailConfirmationDto.fromJson(Map<String, dynamic> json) => _$SendEmailConfirmationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailConfirmationDtoToJson(this);
}
