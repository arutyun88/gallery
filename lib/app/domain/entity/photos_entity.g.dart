// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotosEntity _$$_PhotosEntityFromJson(Map<String, dynamic> json) =>
    _$_PhotosEntity(
      totalItems: json['totalItems'] as int,
      itemsPerPage: json['itemsPerPage'] as int,
      countOfPages: json['countOfPages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => PhotoEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PhotosEntityToJson(_$_PhotosEntity instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
      'countOfPages': instance.countOfPages,
      'data': instance.data,
    };
