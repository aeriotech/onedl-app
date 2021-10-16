// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      discountUuid: json['discountUuid'] as String,
      code: json['code'] as String,
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
      validTo: json['validTo'] == null
          ? null
          : DateTime.parse(json['validTo'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'discountUuid': instance.discountUuid,
      'discount': instance.discount,
      'code': instance.code,
      'validTo': instance.validTo?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
