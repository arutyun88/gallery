import 'package:gallery/app/data/dto/photos_dto.dart';
import 'package:gallery/app/data/field_key.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/domain/entity/photos_entity.dart';
import 'package:gallery/app/domain/repository/photo_repository.dart';
import 'package:injectable/injectable.dart';

const int userIdByPhoto = 3;

@Singleton(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final AppApi _api;

  PhotoRepositoryImpl(this._api);

  @override
  Future<PhotosEntity> getPhotos({
    required int limit,
    required int page,
  }) async {
    try {
      final result = await _api.getPhotos(
        {
          FieldKey.userId: userIdByPhoto,
          FieldKey.page: page,
          FieldKey.limit: limit,
        },
      );
      return PhotosDto.fromJson(result.data).toEntity(page);
    } catch (_) {
      rethrow;
    }
  }
}
