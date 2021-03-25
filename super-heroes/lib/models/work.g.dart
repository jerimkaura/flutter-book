// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) {
  return Work(
    occupation: json['occupation'] as String,
    base: json['base'] as String,
  );
}

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      'occupation': instance.occupation,
      'base': instance.base,
    };
