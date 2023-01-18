import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/error_entity.dart';
import 'package:gallery/app/domain/entity/photos_entity.dart';
import 'package:gallery/app/domain/repository/photo_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'photos_state.dart';

part 'photos_cubit.freezed.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit(this.photoRepository) : super(PhotosState.init());

  final PhotoRepository photoRepository;

  Future<void> getPhotos({
    required int limit,
    required int page,
  }) async {
    emit(PhotosState.waiting());
    try {
      final result = await photoRepository.getPhotos(
        limit: limit,
        page: page,
      );
      emit(PhotosState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(PhotosState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
