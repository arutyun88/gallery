import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_config.dart';
import 'package:gallery/app/domain/entity/photo_entity.dart';
import 'package:gallery/app/domain/entity/photos_entity.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';
import 'package:gallery/app/domain/repository/photo_repository.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/component/custom_loader.dart';
import 'package:gallery/app/ui/component/error_widget.dart';
import 'package:gallery/app/ui/component/home_scaffold.dart';
import 'package:gallery/app/ui/component/photo_tile.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';
import 'package:gallery/feature/photo/state/photos_cubit.dart';
import 'package:gallery/feature/profile/ui/components/profile_statistics_widget.dart';
import 'package:gallery/feature/profile/ui/components/profile_title_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosCubit(locator.get<PhotoRepository>()),
      child: const _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatefulWidget {
  const _ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_ProfileScreen> {
  late UserEntity? entity;
  late ScrollController scrollController;
  bool loading = true;
  bool isRefresh = false;
  Color loaderColor = AppColors.grayLight;

  PhotosEntity? photos;
  bool hasMore = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    entity = locator
        .get<AuthCubit>()
        .state
        .whenOrNull(authorized: (entity) => entity);

    addPhotos();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addPhotos() async {
    loaderColor = photos == null ? AppColors.accent : AppColors.grayLight;
    loading = true;

    await context.read<PhotosCubit>().getPhotos(
          limit: 10,
          page: (photos?.currentPage ?? 0) + 1,
        );
    loading = false;
  }

  void refresh() async {
    isRefresh = true;
    await context.read<PhotosCubit>().getPhotos(limit: 10, page: 1);
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

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: Text(
        AppTexts.profileTitle,
        style: Theme.of(context).textTheme.main,
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          icon: SvgPicture.asset(AppIcons.settingsIcon),
          onPressed: () => context.navigateTo(const ProfileSettingsRoute()),
        ),
      ],
      body: BlocConsumer<PhotosCubit, PhotosState>(
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
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            slivers: [
              if (isRefresh) const SliverToBoxAdapter(child: CustomLoader()),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ProfileTitleWidget(entity: entity),
                    ProfileStatisticsWidget(loaded: photos?.totalItems ?? 0),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: isRefresh ? 0.0 : 30.0,
                  bottom: loading ? 0.0 : 30.0,
                ),
                sliver: photos != null
                    ? SliverGrid.count(
                        childAspectRatio: 1.59,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(
                          photos!.data.length,
                          (index) => PhotoTile(
                            photo: _getUrl(photos!.data[index]),
                            onPressed: () {},
                          ),
                        ),
                      )
                    : isError
                        ? const SliverFillRemaining(
                            hasScrollBody: false,
                            child: CustomErrorWidget(),
                          )
                        : null,
              ),
              if (loading)
                SliverToBoxAdapter(child: CustomLoader(color: loaderColor)),
            ],
          );
        },
      ),
    );
  }

  String _getUrl(PhotoEntity data) =>
      '${locator.get<AppConfig>().baseUrl}/media/${data.image.name}';
}
