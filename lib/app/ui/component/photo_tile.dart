import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';

class PhotoTile extends StatelessWidget {
  const PhotoTile({
    Key? key,
    required this.photo,
    required this.onPressed,
  }) : super(key: key);

  final String photo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.grayLight,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: CachedNetworkImage(
          imageUrl: photo,
          fit: BoxFit.fill,
          placeholder: (context, url) => DecoratedBox(
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
          ),
          errorWidget: (context, url, error) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: SvgPicture.asset(AppIcons.errorIcon),
          ),
        ),
      ),
    );
  }
}
