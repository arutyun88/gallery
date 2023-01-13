import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({
    Key? key,
    required this.isNotAuthorized,
    required this.isAuthorized,
  }) : super(key: key);

  final WidgetBuilder isNotAuthorized;
  final WidgetBuilder isAuthorized;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 2000),
              content: Text(
                error.message,
                textAlign: TextAlign.center,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
      builder: (context, state) {
        return state.when(
          notAuthorized: () => isNotAuthorized(context),
          authorized: () => isAuthorized(context),
          waiting: () => isNotAuthorized(context),
          error: (error) => isNotAuthorized(context),
        );
      },
    );
  }
}
