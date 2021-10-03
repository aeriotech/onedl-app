import 'package:json_annotation/json_annotation.dart';

part 'profile.model.g.dart';

@JsonSerializable()
class Profile {
  final String firstName, lastName, bio;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.bio,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
