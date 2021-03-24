// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biography.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Biography _$BiographyFromJson(Map<String, dynamic> json) {
  return Biography(
    fullName: json['fullName'] as String,
    placeOfBirth: json['placeOfBirth'] as String,
    alignment: json['alignment'] as String,
    firsAppearance: json['firsAppearance'] as String,
  );
}

Map<String, dynamic> _$BiographyToJson(Biography instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'placeOfBirth': instance.placeOfBirth,
      'firsAppearance': instance.firsAppearance,
      'alignment': instance.alignment,
    };
