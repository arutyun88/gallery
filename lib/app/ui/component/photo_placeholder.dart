import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';

class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withOpacity(.5),
            AppColors.subtitle.withOpacity(.5),
          ],
        ),
      ),
    );
  }
}
