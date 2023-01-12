// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_create_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountCreateEntity {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  DateTime get birthday => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountCreateEntityCopyWith<AccountCreateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCreateEntityCopyWith<$Res> {
  factory $AccountCreateEntityCopyWith(
          AccountCreateEntity value, $Res Function(AccountCreateEntity) then) =
      _$AccountCreateEntityCopyWithImpl<$Res, AccountCreateEntity>;
  @useResult
  $Res call(
      {int id,
      String username,
      DateTime birthday,
      String email,
      String password});
}

/// @nodoc
class _$AccountCreateEntityCopyWithImpl<$Res, $Val extends AccountCreateEntity>
    implements $AccountCreateEntityCopyWith<$Res> {
  _$AccountCreateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? birthday = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountCreateEntityCopyWith<$Res>
    implements $AccountCreateEntityCopyWith<$Res> {
  factory _$$_AccountCreateEntityCopyWith(_$_AccountCreateEntity value,
          $Res Function(_$_AccountCreateEntity) then) =
      __$$_AccountCreateEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      DateTime birthday,
      String email,
      String password});
}

/// @nodoc
class __$$_AccountCreateEntityCopyWithImpl<$Res>
    extends _$AccountCreateEntityCopyWithImpl<$Res, _$_AccountCreateEntity>
    implements _$$_AccountCreateEntityCopyWith<$Res> {
  __$$_AccountCreateEntityCopyWithImpl(_$_AccountCreateEntity _value,
      $Res Function(_$_AccountCreateEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? birthday = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_AccountCreateEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountCreateEntity implements _AccountCreateEntity {
  const _$_AccountCreateEntity(
      {required this.id,
      required this.username,
      required this.birthday,
      required this.email,
      required this.password});

  @override
  final int id;
  @override
  final String username;
  @override
  final DateTime birthday;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AccountCreateEntity(id: $id, username: $username, birthday: $birthday, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountCreateEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, birthday, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCreateEntityCopyWith<_$_AccountCreateEntity> get copyWith =>
      __$$_AccountCreateEntityCopyWithImpl<_$_AccountCreateEntity>(
          this, _$identity);
}

abstract class _AccountCreateEntity implements AccountCreateEntity {
  const factory _AccountCreateEntity(
      {required final int id,
      required final String username,
      required final DateTime birthday,
      required final String email,
      required final String password}) = _$_AccountCreateEntity;

  @override
  int get id;
  @override
  String get username;
  @override
  DateTime get birthday;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCreateEntityCopyWith<_$_AccountCreateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
