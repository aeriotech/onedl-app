import 'package:json_annotation/json_annotation.dart';

part 'daily_available.dto.g.dart';

@JsonSerializable()
class DailyAvailableDto {
  final bool available;

  DailyAvailableDto(this.available);

  factory DailyAvailableDto.fromJson(Map<String, dynamic> json) => _$DailyAvailableDtoFromJson(json);

  Map<String, dynamic> toJson(DailyAvailableDto instance) => _$DailyAvailableDtoToJson(instance);
}
