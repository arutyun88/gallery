import 'package:gallery/app/data/app_builder_impl.dart';
import 'package:gallery/app/data/app_runner_impl.dart';

void main() {
  final runner = AppRunnerImpl();
  final builder = AppBuilderImpl();
  runner.run(builder);
}
