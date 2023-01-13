import 'package:flutter/material.dart';
import 'package:gallery/feature/auth/ui/auth_builder.dart';
import 'package:gallery/feature/auth/ui/welcome_screen.dart';
import 'package:gallery/feature/main/main_screen.dart';

class Root extends StatelessWidget {
  const Root({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) => const WelcomeScreen(),
      isAuthorized: (context) => const MainScreen(),
    );
  }
}
