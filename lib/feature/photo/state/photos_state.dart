part of 'photos_cubit.dart';

@freezed
class PhotosState with _$PhotosState {
  factory PhotosState.init() = _PhotosStateInit;

  factory PhotosState.received(PhotosEntity entity) = _PhotosStateReceived;

  factory PhotosState.waiting() = _PhotosStateWaiting;

  factory PhotosState.error(ErrorEntity error) = _PhotosStateError;
}
