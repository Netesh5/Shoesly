import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/shimmer_effect.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/cubit/fetch_shoes_data_cubit.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/homepage_app_bar.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/item_info_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/item_widget.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late ScrollController scrollController;
  bool isVisible = true;
  @override
  void initState() {
    context.read<FetchShoesDataCubit>().fetchStoreData();
    scrollController = ScrollController();
    super.initState();
  }

  ShoesBrand currentBrand = ShoesBrand.All;
  List<Shoes> filterData = [];
  filterItems(List<Shoes> shoes) {
    if (currentBrand == ShoesBrand.All) {
      return shoes;
    }
    return shoes
        .where((element) => element.brand == currentBrand.brandName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                isVisible = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                isVisible = false;
              });
            }
            return true;
          },
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              HomepageAppBar(
                onTap: (value) {
                  currentBrand = value;
                  setState(() {});
                },
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(),
                sliver: BlocBuilder<FetchShoesDataCubit, CommonState>(
                  builder: (context, state) {
                    if (state is CommonLoadingState) {
                      return const CustomShimmerEffect();
                    }
                    if (state is CommonSuccessState<List<Shoes>>) {
                      filterData = filterItems(state.data);

                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        sliver: SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 14,
                            ),
                            itemCount: filterData.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  NavigationService.pushNamed(
                                    routeName: Routes.detailScreen,
                                    args: filterData[index],
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemCardWidget(
                                      data: filterData,
                                      index: index,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ItemInfoWidget(
                                      data: filterData,
                                      index: index,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                    return const CustomShimmerEffect();
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: isVisible
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: FloatingActionButton.extended(
                    backgroundColor: AppColors.primaryDark,
                    onPressed: () {},
                    label: Text(
                      "Filter",
                      style: AppTextStyle.heading300.copyWith(
                        color: AppColors.primarylight,
                      ),
                    ),
                    icon: CustomIcon.applyStyle(
                      Assets.filter,
                      width: 20,
                      color: AppColors.primarylight,
                    ),
                  ),
                ),
              )
            : null);
  }
}
