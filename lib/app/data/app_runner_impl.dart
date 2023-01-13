import 'package:flutter/widgets.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_builder.dart';
import 'package:gallery/app/domain/app_runner.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class AppRunnerImpl implements AppRunner {
  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await path_provider.getApplicationDocumentsDirectory(),
    );
    initDi();
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}
