// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/auth/state/auth_cubit.dart' as _i11;
import '../data/api/app_api_dio.dart' as _i6;
import '../data/app_config_impl.dart' as _i4;
import '../data/repository/auth_repository_impl.dart' as _i8;
import '../data/repository/photo_repository_impl.dart' as _i10;
import '../domain/app_api.dart' as _i5;
import '../domain/app_config.dart' as _i3;
import '../domain/repository/auth_repository.dart' as _i7;
import '../domain/repository/photo_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppConfig>(_i4.AppConfigImpl());
  gh.singleton<_i5.AppApi>(_i6.AppApiDio(get<_i3.AppConfig>()));
  gh.singleton<_i7.AuthRepository>(_i8.AuthRepositoryImpl(get<_i5.AppApi>()));
  gh.singleton<_i9.PhotoRepository>(
      _i10.PhotoRepositoryImpl(get<_i5.AppApi>()));
  gh.singleton<_i11.AuthCubit>(_i11.AuthCubit(get<_i7.AuthRepository>()));
  return get;
}
