// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      logo: json['logo'] == null
          ? null
          : PublicFile.fromJson(json['logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'logo': instance.logo,
    };
