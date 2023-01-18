import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:image_picker/image_picker.dart';

class CustomSheetWidget extends StatelessWidget {
  const CustomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    onPressed: () => _onTap(context, ImageSource.gallery),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Text(
                          AppTexts.selectFromGallery,
                          style: Theme.of(context).textTheme.main.apply(
                                color: AppColors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.grayLight,
                  ),
                  CupertinoButton(
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    onPressed: () => _onTap(context, ImageSource.camera),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Text(
                          AppTexts.makePhoto,
                          style: Theme.of(context).textTheme.main.apply(
                                color: AppColors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14.0),
                child: CupertinoButton(
                  minSize: 0.0,
                  padding: EdgeInsets.zero,
                  onPressed: Navigator.of(context).pop,
                  child: Center(
                    child: Text(
                      AppTexts.cancel,
                      style: Theme.of(context).textTheme.main.apply(
                            color: AppColors.accent,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _pickerImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return image?.path;
  }

  void _onTap(BuildContext context, ImageSource source) =>
      _pickerImage(source).then((value) => Navigator.of(context).pop(value));
}
