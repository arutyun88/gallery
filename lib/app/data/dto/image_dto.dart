import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/image_entity.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  final dynamic id;
  final dynamic name;

  ImageDto({
    this.id,
    this.name,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);

  ImageEntity toEntity() => ImageEntity(
        id: id,
        name: name.toString(),
      );
}
