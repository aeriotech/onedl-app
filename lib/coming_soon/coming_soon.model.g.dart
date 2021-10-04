// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComingSoon _$ComingSoonFromJson(Map<String, dynamic> json) => ComingSoon(
      name: json['name'] as String,
      image: PublicFile.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComingSoonToJson(ComingSoon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
