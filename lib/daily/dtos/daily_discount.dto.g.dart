// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_discount.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyDiscountDto _$DailyDiscountDtoFromJson(Map<String, dynamic> json) =>
    DailyDiscountDto(
      json['title'] as String?,
      json['description'] as String?,
      Discount.fromJson(json['discount'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : PublicFile.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyDiscountDtoToJson(DailyDiscountDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'discount': instance.discount,
      'image': instance.image,
    };
