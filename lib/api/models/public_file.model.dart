import 'package:json_annotation/json_annotation.dart';

part 'public_file.model.g.dart';

@JsonSerializable()
class PublicFile {
  final String url;

  PublicFile({required this.url});

  factory PublicFile.fromJson(Map<String, dynamic> json) => _$PublicFileFromJson(json);

  Map<String, dynamic> toJson() => _$PublicFileToJson(this);
}
