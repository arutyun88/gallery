import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_config.dart';
import 'package:gallery/app/domain/entity/photo_entity.dart';
import 'package:gallery/app/domain/entity/photos_entity.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/component/custom_loader.dart';
import 'package:gallery/app/ui/component/error_widget.dart';
import 'package:gallery/app/ui/component/photo_tile.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/feature/photo/state/photos_cubit.dart';

class FeedGrid extends StatefulWidget {
  const FeedGrid({
    Key? key,
    required this.isNew,
  }) : super(key: key);

  final bool isNew;

  @override
  State<FeedGrid> createState() => _FeedGridState();
}

class _FeedGridState extends State<FeedGrid> {
  PhotosEntity? photos;
  late ScrollController scrollController;
  bool loading = true;
  bool isRefresh = false;
  bool hasMore = true;
  Color loader = AppColors.grayLight;
  bool isError = false;

  @override
  void initState() {
    super.initState();

    addPhotos();

    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosCubit, PhotosState>(
      listener: (context, state) {
        state.whenOrNull(
          received: (entity) {
            isError = false;
            hasMore = entity.currentPage != entity.countOfPages;
            if (entity.currentPage == 1) {
              photos = null;
              isError = false;
            }
            if (photos == null) {
              photos = entity;
            } else {
              final old = photos!.data.map((e) => e).toList();
              old.addAll(entity.data);
              photos = photos!.copyWith(
                data: old,
                currentPage: entity.currentPage,
              );
            }
          },
          error: (error) {
            loading = false;
            isError = true;
          },
        );
      },
      builder: (context, state) {
        if (photos != null) {
          return Column(
            children: [
              if (isRefresh) const CustomLoader(),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  childAspectRatio: 1.59,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: isRefresh ? 0.0 : 30.0,
                    bottom: loading ? 0.0 : 30.0,
                  ),
                  children: List.generate(
                    photos!.data.length,
                    (index) => PhotoTile(
                      photo: _getUrl(photos!.data[index]),
                      onPressed: () {
                        context.navigateTo(
                          FeedItemRoute(
                            feedId: photos!.data[index].id,
                            photo: photos!.data[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (loading) CustomLoader(color: loader),
            ],
          );
        } else if (isError) {
          return const CustomErrorWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void addPhotos() async {
    loader = photos == null ? AppColors.accent : AppColors.grayLight;
    loading = true;

    if (widget.isNew) {
      await context.read<PhotosCubit>().getPhotos(
          limit: 10, page: (photos?.currentPage ?? 0) + 1, isNew: true);
    } else {
      await context.read<PhotosCubit>().getPhotos(
          limit: 10, page: (photos?.currentPage ?? 0) + 1, isPopular: true);
    }

    loading = false;
  }

  void refresh() async {
    isRefresh = true;
    if (widget.isNew) {
      await context
          .read<PhotosCubit>()
          .getPhotos(limit: 10, page: 1, isNew: true);
    } else {
      await context
          .read<PhotosCubit>()
          .getPhotos(limit: 10, page: 1, isPopular: true);
    }
    isRefresh = false;
  }

  void _scrollListener() {
    if (scrollController.position.pixels < -100 && !loading) {
      refresh();
    } else if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * .80 &&
        !loading &&
        photos != null) {
      if (hasMore) {
        addPhotos();
      }
    }
  }

  String _getUrl(PhotoEntity data) =>
      '${locator.get<AppConfig>().baseUrl}/media/${data.image.name}';
}
