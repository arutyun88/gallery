import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_builder.dart';
import 'package:gallery/app/ui/const/app_theme.dart';
import 'package:gallery/app/ui/root.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class AppBuilderImpl implements AppBuilder {
  @override
  Widget buildApp() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.get<AuthCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        title: 'Gallery',
        home: const Root(),
      ),
    );
  }
}
