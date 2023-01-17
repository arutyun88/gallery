// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
      id: json['id'],
      name: json['name'],
      dateCreate: json['dateCreate'],
      description: json['description'],
      isNew: json['new'],
      isPopular: json['popular'],
      image: json['image'],
      user: json['user'],
    );

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateCreate': instance.dateCreate,
      'description': instance.description,
      'new': instance.isNew,
      'popular': instance.isPopular,
      'image': instance.image,
      'user': instance.user,
    };
