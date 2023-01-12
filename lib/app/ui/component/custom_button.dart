import 'package:flutter/cupertino.dart';
import 'package:gallery/app/ui/const/app_colors.dart';

enum ButtonType { simple, transparent, text }

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.type = ButtonType.simple,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0.0,
      onPressed: onPressed,
      child: type == ButtonType.text
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          : Container(
              height: 44.0,
              width: MediaQuery.of(context).size.width,
              decoration: type == ButtonType.transparent
                  ? BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.black),
                    )
                  : BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: type == ButtonType.transparent
                        ? AppColors.black
                        : AppColors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
    );
  }
}
