import 'package:gallery/app/domain/entity/photos_entity.dart';

abstract class PhotoRepository {
  Future<PhotosEntity> getPhotos({
    required int limit,
    required int page,
  });
}
