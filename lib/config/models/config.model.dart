import 'package:json_annotation/json_annotation.dart';

part 'config.model.g.dart';

@JsonSerializable()
class Config {
  final String apiUrl, vapidKey;

  Config({
    required this.apiUrl,
    required this.vapidKey,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
