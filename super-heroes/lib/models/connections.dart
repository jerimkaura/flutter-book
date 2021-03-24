import 'package:json_annotation/json_annotation.dart';

part 'connections.g.dart';

@JsonSerializable()
class Connections {
  String groupAffiliation;
  String relatives;
  String image;
  Connections({this.groupAffiliation, this.relatives, this.image});

  factory Connections.fromJson(Map<String, dynamic> data) =>
      _$ConnectionsFromJson(data);

  Map<String, dynamic> toJson() => _$ConnectionsToJson(this);
}