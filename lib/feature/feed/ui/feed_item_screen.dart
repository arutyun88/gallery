import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_config.dart';
import 'package:gallery/app/domain/entity/photo_entity.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/photo_error_widget.dart';
import 'package:gallery/app/ui/component/photo_placeholder.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';
import 'package:intl/intl.dart';

class FeedItemScreen extends StatelessWidget {
  const FeedItemScreen({
    Key? key,
    @PathParam() required this.feedId,
    required this.photo,
  }) : super(key: key);

  final int feedId;
  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      withAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: _getUrl(photo),
                fit: BoxFit.cover,
                placeholder: (context, url) => const PhotoPlaceholder(),
                errorWidget: (context, url, error) => const PhotoErrorWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      photo.name,
                      style: Theme.of(context).textTheme.title.apply(
                            color: AppColors.title,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      locator.get<AuthCubit>().state.whenOrNull(
                              authorized: (entity) => entity.username) ??
                          '',
                      style: Theme.of(context).textTheme.main.apply(
                            color: AppColors.accent,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      photo.description,
                      style: Theme.of(context).textTheme.min.apply(
                            color: AppColors.text,
                          ),
                    ),
                  ),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: const [
                      TagItem(title: 'Anumals'),
                      TagItem(title: 'tag2928239203023923029302238...'),
                      TagItem(title: 'Girl'),
                      TagItem(title: 'Some'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      DateFormat('dd MMM yyyy').format(photo.dateCreate),
                      style: Theme.of(context).textTheme.min.apply(
                            color: AppColors.subtitle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppTexts.viewsTitle,
                          style: Theme.of(context).textTheme.min,
                        ),
                        Text(
                          '999+',
                          style: Theme.of(context).textTheme.min.apply(
                                color: AppColors.subtitle,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getUrl(PhotoEntity data) =>
      '${locator.get<AppConfig>().baseUrl}/media/${data.image.name}';
}

class TagItem extends StatelessWidget {
  const TagItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.accent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.min.apply(color: AppColors.white),
      ),
    );
  }
}
