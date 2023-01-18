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
    bool? isPopular,
    bool? isNew,
  }) async {
    try {
      Map<String, dynamic> data = {
        FieldKey.userId: userIdByPhoto,
        FieldKey.page: page,
        FieldKey.limit: limit,
      };
      if (isPopular == true) {
        data.addAll({FieldKey.isPopular: isPopular});
      } else if (isNew == true) {
        data.addAll({FieldKey.isNew: isNew});
      }
      final result = await _api.getPhotos(data);
      return PhotosDto.fromJson(result.data).toEntity(page);
    } catch (_) {
      rethrow;
    }
  }
}
