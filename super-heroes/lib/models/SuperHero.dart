import 'package:json_annotation/json_annotation.dart';

import 'appearance.dart';
import 'biography.dart';
import 'connections.dart';
import 'powerstats.dart';
import 'work.dart';

@JsonSerializable()
class SuperHero {
  int superheroID;
  String name;
  String avatarUrl;
  PowerStats powerStats;
  Biography biography;
  Connections connections;
  Work work;
  Appearance appearance;

  SuperHero(
      {this.superheroID,
      this.name,
      this.avatarUrl,
      this.powerStats,
      this.biography,
      this.connections,
      this.work,
      this.appearance});

  factory SuperHero.fromJson(Map<String, dynamic> data) =>
      _$SuperHeroFromJson(data);

  Map<String, dynamic> toJson() => _$SuperHeroToJson(this);
}
