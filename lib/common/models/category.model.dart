import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.model.g.dart';

@JsonSerializable()
class Category {
  final String uuid;
  final String name;
  final PublicFile background;

  Category(this.uuid, this.name, this.background);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson(Category instance) => _$CategoryToJson(instance);
}
