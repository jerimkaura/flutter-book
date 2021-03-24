// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Connections _$ConnectionsFromJson(Map<String, dynamic> json) {
  return Connections(
    groupAffiliation: json['groupAffiliation'] as String,
    relatives: json['relatives'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$ConnectionsToJson(Connections instance) =>
    <String, dynamic>{
      'groupAffiliation': instance.groupAffiliation,
      'relatives': instance.relatives,
      'image': instance.image,
    };
