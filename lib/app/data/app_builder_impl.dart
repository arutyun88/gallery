import 'package:flutter/material.dart';
import 'package:gallery/app/domain/app_builder.dart';
import 'package:gallery/app/ui/const/app_theme.dart';

class AppBuilderImpl implements AppBuilder {
  @override
  Widget buildApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: 'Gallery',
      home: const Scaffold(),
    );
  }
}
