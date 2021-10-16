// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      categoryUuid: json['categoryUuid'] as String?,
      couponType: _$enumDecode(_$CouponTypeEnumMap, json['couponType']),
      thumbnail: json['thumbnail'] == null
          ? null
          : PublicFile.fromJson(json['thumbnail'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : PublicFile.fromJson(json['image'] as Map<String, dynamic>),
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'description': instance.description,
      'categoryUuid': instance.categoryUuid,
      'couponType': _$CouponTypeEnumMap[instance.couponType],
      'thumbnail': instance.thumbnail,
      'image': instance.image,
      'shop': instance.shop,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$CouponTypeEnumMap = {
  CouponType.code: 'CODE',
  CouponType.url: 'URL',
  CouponType.barcode: 'BARCODE',
};
