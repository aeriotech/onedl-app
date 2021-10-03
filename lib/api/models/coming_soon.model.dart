import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coming_soon.model.g.dart';

final api = ApiService.instance;

@JsonSerializable()
class ComingSoon {
  final String name;
  final PublicFile image;

  ComingSoon({
    required this.name,
    required this.image,
  });

  factory ComingSoon.fromJson(Map<String, dynamic> json) => _$ComingSoonFromJson(json);

  Map<String, dynamic> toJson() => _$ComingSoonToJson(this);

  static Future<List<ComingSoon>> getComingSoon() async {
    final response = await api.client.get('/coming-soon');

    final jsonList = List.from(response.data);
    final comingSoon = jsonList.map((json) => ComingSoon.fromJson(json)).toList();

    return comingSoon;
  }
}
