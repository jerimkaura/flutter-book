// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'powerstats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerStats _$PowerStatsFromJson(Map<String, dynamic> json) {
  return PowerStats(
    intelligence: json['intelligence'] as int,
    strength: json['strength'] as int,
    speed: json['speed'] as int,
    durability: json['durability'] as int,
    power: json['power'] as int,
    combat: json['combat'] as int,
  );
}

Map<String, dynamic> _$PowerStatsToJson(PowerStats instance) =>
    <String, dynamic>{
      'intelligence': instance.intelligence,
      'strength': instance.strength,
      'speed': instance.speed,
      'durability': instance.durability,
      'power': instance.power,
      'combat': instance.combat,
    };
