// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      apiUrl: json['apiUrl'] as String,
      vapidKey: json['vapidKey'] as String,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'vapidKey': instance.vapidKey,
    };
