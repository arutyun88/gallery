import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.logo,
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 60.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Text(
                      AppTexts.welcome,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  CustomButton(
                    title: AppTexts.welcomeCreate,
                    onPressed: _onTapToCreate,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomButton(
                      title: AppTexts.alreadyHaveAccount,
                      onPressed: _onTapToLogIn,
                      type: ButtonType.transparent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapToCreate() => context.router.push(const RegisterRoute());

  void _onTapToLogIn() => context.router.push(const LogInRoute());
}
