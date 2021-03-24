import 'package:json_annotation/json_annotation.dart';

part 'work.g.dart';

@JsonSerializable()
class Work {
  String occupation;
  String base;
  Work({this.occupation, this.base});

  factory Work.fromJson(Map<String, dynamic> data) =>
      _$WorkFromJson(data);

  Map<String, dynamic> toJson() => _$WorkToJson(this);
}