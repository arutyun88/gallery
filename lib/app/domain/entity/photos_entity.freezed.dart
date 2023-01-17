// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photos_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotosEntity _$PhotosEntityFromJson(Map<String, dynamic> json) {
  return _PhotosEntity.fromJson(json);
}

/// @nodoc
mixin _$PhotosEntity {
  int get totalItems => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  int get countOfPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  List<PhotoEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotosEntityCopyWith<PhotosEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosEntityCopyWith<$Res> {
  factory $PhotosEntityCopyWith(
          PhotosEntity value, $Res Function(PhotosEntity) then) =
      _$PhotosEntityCopyWithImpl<$Res, PhotosEntity>;
  @useResult
  $Res call(
      {int totalItems,
      int itemsPerPage,
      int countOfPages,
      int currentPage,
      List<PhotoEntity> data});
}

/// @nodoc
class _$PhotosEntityCopyWithImpl<$Res, $Val extends PhotosEntity>
    implements $PhotosEntityCopyWith<$Res> {
  _$PhotosEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? countOfPages = null,
    Object? currentPage = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      countOfPages: null == countOfPages
          ? _value.countOfPages
          : countOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotosEntityCopyWith<$Res>
    implements $PhotosEntityCopyWith<$Res> {
  factory _$$_PhotosEntityCopyWith(
          _$_PhotosEntity value, $Res Function(_$_PhotosEntity) then) =
      __$$_PhotosEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalItems,
      int itemsPerPage,
      int countOfPages,
      int currentPage,
      List<PhotoEntity> data});
}

/// @nodoc
class __$$_PhotosEntityCopyWithImpl<$Res>
    extends _$PhotosEntityCopyWithImpl<$Res, _$_PhotosEntity>
    implements _$$_PhotosEntityCopyWith<$Res> {
  __$$_PhotosEntityCopyWithImpl(
      _$_PhotosEntity _value, $Res Function(_$_PhotosEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? countOfPages = null,
    Object? currentPage = null,
    Object? data = null,
  }) {
    return _then(_$_PhotosEntity(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      countOfPages: null == countOfPages
          ? _value.countOfPages
          : countOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhotosEntity implements _PhotosEntity {
  const _$_PhotosEntity(
      {required this.totalItems,
      required this.itemsPerPage,
      required this.countOfPages,
      required this.currentPage,
      required final List<PhotoEntity> data})
      : _data = data;

  factory _$_PhotosEntity.fromJson(Map<String, dynamic> json) =>
      _$$_PhotosEntityFromJson(json);

  @override
  final int totalItems;
  @override
  final int itemsPerPage;
  @override
  final int countOfPages;
  @override
  final int currentPage;
  final List<PhotoEntity> _data;
  @override
  List<PhotoEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PhotosEntity(totalItems: $totalItems, itemsPerPage: $itemsPerPage, countOfPages: $countOfPages, currentPage: $currentPage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotosEntity &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.countOfPages, countOfPages) ||
                other.countOfPages == countOfPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalItems, itemsPerPage,
      countOfPages, currentPage, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotosEntityCopyWith<_$_PhotosEntity> get copyWith =>
      __$$_PhotosEntityCopyWithImpl<_$_PhotosEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotosEntityToJson(
      this,
    );
  }
}

abstract class _PhotosEntity implements PhotosEntity {
  const factory _PhotosEntity(
      {required final int totalItems,
      required final int itemsPerPage,
      required final int countOfPages,
      required final int currentPage,
      required final List<PhotoEntity> data}) = _$_PhotosEntity;

  factory _PhotosEntity.fromJson(Map<String, dynamic> json) =
      _$_PhotosEntity.fromJson;

  @override
  int get totalItems;
  @override
  int get itemsPerPage;
  @override
  int get countOfPages;
  @override
  int get currentPage;
  @override
  List<PhotoEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PhotosEntityCopyWith<_$_PhotosEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
