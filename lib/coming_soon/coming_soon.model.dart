import 'package:fundl_app/api/models/public_file.model.dart';
import 'package:fundl_app/api/services/api.service.dart';
import 'package:json_annotation/json_annotation.dart';

import 'coming_soon.service.dart';

part 'coming_soon.model.g.dart';

final client = ApiService.instance.client;
final comingSoonService = client.getService<ComingSoonService>();

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
    final response = await comingSoonService.getComingSoon();
    final comingSoon = response.body;
    if (comingSoon == null) {
      throw Exception('No coming soon found');
    }
    return comingSoon;
  }
}
