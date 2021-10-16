// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['uuid'] as String,
      json['name'] as String,
      PublicFile.fromJson(json['background'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'background': instance.background,
    };
