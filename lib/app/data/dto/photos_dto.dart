import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/data/dto/photo_dto.dart';
import 'package:gallery/app/domain/entity/photos_entity.dart';

part 'photos_dto.g.dart';

@JsonSerializable()
class PhotosDto {
  final dynamic totalItems;
  final dynamic itemsPerPage;
  final dynamic countOfPages;
  final dynamic data;

  PhotosDto({
    this.totalItems,
    this.itemsPerPage,
    this.countOfPages,
    this.data,
  });

  factory PhotosDto.fromJson(Map<String, dynamic> json) =>
      _$PhotosDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosDtoToJson(this);

  PhotosEntity toEntity(int currentPage) => PhotosEntity(
        totalItems: totalItems,
        itemsPerPage: itemsPerPage,
        countOfPages: countOfPages,
        currentPage: currentPage,
        data: (data as List)
            .map(
              (e) => PhotoDto.fromJson(e).toEntity(),
            )
            .toList(),
      );
}
