import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/feed/ui/feed_item_screen.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  final String fileName;

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  bool _validated = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      withAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Image.file(
                File(widget.fileName),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: AppTexts.nameTitle,
                      controller: _nameController,
                      onChanged: (value) => _validate(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: CustomTextField(
                        labelText: AppTexts.descriptionTitle,
                        controller: _descriptionController,
                        isMultiline: true,
                        onChanged: (value) => _validate(),
                      ),
                    ),
                    Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: const [
                        TagItem(title: 'Animals'),
                        TagItem(title: 'tag2928239203023923029302238...'),
                        TagItem(title: 'Girl'),
                        TagItem(title: 'Some'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 40.0,
                ),
                child: CustomButton(
                  title: AppTexts.uploadTitle,
                  onPressed: _validated ? () => context.popRoute(true) : null,
                  enabled: _validated,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate() => setState(
        () {
          _validated = _nameController.text.trim().isNotEmpty &&
              _descriptionController.text.trim().isNotEmpty;
        },
      );
}
