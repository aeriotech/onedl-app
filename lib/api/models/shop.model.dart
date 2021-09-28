import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.model.g.dart';

@JsonSerializable()
class Shop {
  Shop({
    required this.logo,
  });

  final PublicFile logo;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
