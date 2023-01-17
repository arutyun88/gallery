// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoEntity _$$_PhotoEntityFromJson(Map<String, dynamic> json) =>
    _$_PhotoEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      dateCreate: DateTime.parse(json['dateCreate'] as String),
      description: json['description'] as String,
      isNew: json['isNew'] as bool,
      isPopular: json['isPopular'] as bool,
      image: ImageEntity.fromJson(json['image'] as Map<String, dynamic>),
      user: json['user'] as String,
    );

Map<String, dynamic> _$$_PhotoEntityToJson(_$_PhotoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateCreate': instance.dateCreate.toIso8601String(),
      'description': instance.description,
      'isNew': instance.isNew,
      'isPopular': instance.isPopular,
      'image': instance.image,
      'user': instance.user,
    };
