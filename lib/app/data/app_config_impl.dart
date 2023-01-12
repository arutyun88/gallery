import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/domain/app_config.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppConfig)
class AppConfigImpl implements AppConfig {
  @override
  String get baseUrl => AppApi.baseUrl;
}
