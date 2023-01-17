import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/image_entity.dart';
import 'package:gallery/app/domain/entity/photo_entity.dart';

part 'photos_entity.freezed.dart';

part 'photos_entity.g.dart';

@freezed
class PhotosEntity with _$PhotosEntity {
  const factory PhotosEntity({
    required int totalItems,
    required int itemsPerPage,
    required int countOfPages,
    required List<PhotoEntity> data,
  }) = _PhotosEntity;

  factory PhotosEntity.fromJson(Map<String, dynamic> json) =>
      _$PhotosEntityFromJson(json);
}
