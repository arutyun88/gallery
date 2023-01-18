import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/photo_error_widget.dart';
import 'package:gallery/app/ui/component/photo_placeholder.dart';
import 'package:gallery/app/ui/const/app_colors.dart';

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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.grayLight,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: CachedNetworkImage(
          imageUrl: photo,
          fit: BoxFit.cover,
          placeholder: (context, url) => const PhotoPlaceholder(),
          errorWidget: (context, url, error) => const PhotoErrorWidget(),
        ),
      ),
    );
  }
}
