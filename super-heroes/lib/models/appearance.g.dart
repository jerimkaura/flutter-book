// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appearance _$AppearanceFromJson(Map<String, dynamic> json) {
  return Appearance(
    gender: json['gender'] as String,
    eyeColor: json['eyeColor'] as String,
    hairColor: json['hairColor'] as String,
    race: json['race'] as String,
  );
}

Map<String, dynamic> _$AppearanceToJson(Appearance instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'eyeColor': instance.eyeColor,
      'hairColor': instance.hairColor,
      'race': instance.race,
    };
