import 'package:json_annotation/json_annotation.dart';

part 'biography.g.dart';

@JsonSerializable()
class Biography {
  String fullName, placeOfBirth, firsAppearance, alignment;
  Biography({this.fullName, this.placeOfBirth, this.alignment, this.firsAppearance});

  factory Biography.fromJson(Map<String, dynamic> data) =>
      _$BiographyFromJson(data);

  Map<String, dynamic> toJson() => _$BiographyToJson(this);
}
