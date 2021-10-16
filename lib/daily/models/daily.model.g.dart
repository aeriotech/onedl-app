// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      json['uuid'] as String,
      json['name'] as String,
      json['background'] == null
          ? null
          : PublicFile.fromJson(json['background'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'background': instance.background,
    };
