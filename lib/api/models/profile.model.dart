import 'package:json_annotation/json_annotation.dart';

part 'profile.model.g.dart';

@JsonSerializable()
class Profile {
  final String firstName, lastName, bio;
  final DateTime updatedAt;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
