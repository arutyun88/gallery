import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/home_scaffold.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      actions: [
        SizedBox(
          child: CustomButton(
            type: ButtonType.text,
            title: 'Save',
            onPressed: () {},
          ),
        ),
      ],
      body: const Center(
        child: Text('ProfileSettingsScreen'),
      ),
    );
  }
}
