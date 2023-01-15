import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';

enum ButtonType { simple, transparent, text }

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.type = ButtonType.simple,
    this.enabled = true,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final ButtonType type;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0.0,
      onPressed: onPressed,
      child: type == ButtonType.text
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.main.apply(
                      color: enabled
                          ? AppColors.accent
                          : AppColors.accent.withOpacity(.3),
                    ),
              ),
            )
          : Container(
              height: 44.0,
              width: MediaQuery.of(context).size.width,
              decoration: type == ButtonType.transparent
                  ? BoxDecoration(
                      color: enabled
                          ? AppColors.transparent
                          : AppColors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.black),
                    )
                  : BoxDecoration(
                      color: enabled
                          ? AppColors.black
                          : AppColors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.main.apply(
                        color: type == ButtonType.transparent
                            ? AppColors.black
                            : AppColors.white,
                      ),
                ),
              ),
            ),
    );
  }
}
