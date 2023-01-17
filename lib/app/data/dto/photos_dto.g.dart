// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosDto _$PhotosDtoFromJson(Map<String, dynamic> json) => PhotosDto(
      totalItems: json['totalItems'],
      itemsPerPage: json['itemsPerPage'],
      countOfPages: json['countOfPages'],
      data: json['data'],
    );

Map<String, dynamic> _$PhotosDtoToJson(PhotosDto instance) => <String, dynamic>{
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
      'countOfPages': instance.countOfPages,
      'data': instance.data,
    };
