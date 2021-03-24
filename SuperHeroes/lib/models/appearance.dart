import 'package:json_annotation/json_annotation.dart';

part 'appearance.g.dart';

@JsonSerializable()
class Appearance {
  String gender, eyeColor, hairColor, race;
  Appearance({this.gender, this.eyeColor, this.hairColor, this.race});

  factory Appearance.fromJson(Map<String, dynamic> data) =>
      _$AppearanceFromJson(data);

  Map<String, dynamic> toJson() => _$AppearanceToJson(this);
}
