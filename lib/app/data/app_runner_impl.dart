import 'package:flutter/widgets.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_builder.dart';
import 'package:gallery/app/domain/app_runner.dart';

class AppRunnerImpl implements AppRunner {
  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    initDi();
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}
