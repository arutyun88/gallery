import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/image_entity.dart';

part 'photo_entity.freezed.dart';

part 'photo_entity.g.dart';

@freezed
class PhotoEntity with _$PhotoEntity {
  const factory PhotoEntity({
    required int id,
    required String name,
    required DateTime dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    required ImageEntity image,
    required String user,
  }) = _PhotoEntity;

  factory PhotoEntity.fromJson(Map<String, dynamic> json) =>
      _$PhotoEntityFromJson(json);
}
