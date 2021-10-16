import 'package:fundl_app/api/models/discount.model.dart';
import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_discount.dto.g.dart';

@JsonSerializable()
class DailyDiscountDto {
  final String? title, description;
  final Discount discount;
  final PublicFile? image;

  DailyDiscountDto(this.title, this.description, this.discount, this.image);

  factory DailyDiscountDto.fromJson(Map<String, dynamic> json) => _$DailyDiscountDtoFromJson(json);

  Map<String, dynamic> toJson(DailyDiscountDto instance) => _$DailyDiscountDtoToJson(instance);
}
