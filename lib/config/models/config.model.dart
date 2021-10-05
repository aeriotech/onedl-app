import 'package:json_annotation/json_annotation.dart';

part 'config.model.g.dart';

@JsonSerializable()
class Config {
  final String apiUrl;

  Config({
    required this.apiUrl,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
