import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/data/dto/image_dto.dart';
import 'package:gallery/app/domain/entity/photo_entity.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  final dynamic id;
  final dynamic name;
  final dynamic dateCreate;
  final dynamic description;
  @JsonKey(name: 'new')
  final dynamic isNew;
  @JsonKey(name: 'popular')
  final dynamic isPopular;
  final dynamic image;
  final dynamic user;

  PhotoDto({
    this.id,
    this.name,
    this.dateCreate,
    this.description,
    this.isNew,
    this.isPopular,
    this.image,
    this.user,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  PhotoEntity toEntity() => PhotoEntity(
        id: id,
        name: name.toString(),
        dateCreate: DateTime.parse(dateCreate.toString()),
        description: description.toString(),
        isNew: isNew,
        isPopular: isPopular,
        image: ImageDto.fromJson(image).toEntity(),
        user: user.toString(),
      );
}
