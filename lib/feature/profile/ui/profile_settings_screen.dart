import 'package:flutter/material.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/home_scaffold.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';
import 'package:gallery/feature/profile/ui/components/change_password_widget.dart';
import 'package:gallery/feature/profile/ui/components/profile_settings_other_actions_widget.dart';
import 'package:gallery/feature/profile/ui/components/profile_settings_title_widget.dart';
import 'package:gallery/feature/profile/ui/components/user_info_widget.dart';
import 'package:intl/intl.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  late UserEntity? entity;

  late TextEditingController usernameController;
  late TextEditingController birthdayController;
  late TextEditingController emailController;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  @override
  void initState() {
    super.initState();
    entity = locator.get<AuthCubit>().state.whenOrNull(
          authorized: (entity) => entity,
        );

    usernameController = TextEditingController(text: entity?.username ?? '');
    if (entity?.birthday == null) {
      birthdayController = TextEditingController();
    } else {
      birthdayController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(entity!.birthday),
      );
    }
    emailController = TextEditingController(text: entity?.email ?? '');

    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      actions: [
        SizedBox(
          child: CustomButton(
            type: ButtonType.text,
            title: AppTexts.save,
            onPressed: () {},
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const ProfileSettingsTitleWidget(),
              UserInfoWidget(
                usernameController: usernameController,
                birthdayController: birthdayController,
                emailController: emailController,
                usernameChanged: usernameChanged,
                birthdayChanged: birthdayChanged,
                emailChanged: emailChanged,
              ),
              ChangePasswordWidget(
                oldPasswordController: oldPasswordController,
                newPasswordController: newPasswordController,
                confirmNewPasswordController: confirmNewPasswordController,
                oldPasswordChanged: oldPasswordChanged,
                newPasswordChanged: newPasswordChanged,
                confirmNewPasswordChanged: confirmNewPasswordChanged,
              ),
              const ProfileSettingsOtherActionsWidget(),
            ],
          ),
        ),
      ),
    );
  }

  void usernameChanged(String value) {}

  void birthdayChanged(String value) {}

  void emailChanged(String value) {}

  void oldPasswordChanged(String value) {}

  void newPasswordChanged(String value) {}

  void confirmNewPasswordChanged(String value) {}
}
