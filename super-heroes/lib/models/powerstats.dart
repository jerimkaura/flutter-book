import 'package:json_annotation/json_annotation.dart';

part 'powerstats.g.dart';

@JsonSerializable()
class PowerStats {
  int intelligence, strength, speed, durability, power, combat;
  PowerStats(
      {this.intelligence,
      this.strength,
      this.speed,
      this.power,
      this.durability,
      this.combat});

  factory PowerStats.fromJson(Map<String, dynamic> data) =>
      _$PowerStatsFromJson(data);

  Map<String, dynamic> toJson() => _$PowerStatsToJson(this);
}
