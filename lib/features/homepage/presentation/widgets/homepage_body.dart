import 'dart:io';

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
import 'package:priority_soft_ecommerce/core/widgets/no_data_widget.dart';
import 'package:priority_soft_ecommerce/core/widgets/shimmer_effect.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/fetch_cart_detail.dart';
import 'package:priority_soft_ecommerce/features/filter_page/presentation/widgets/filter_bottomsheet.dart';
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
    // CloudFirestoreService().uplodImage();
    context.read<FetchCartDetailCubit>().fetchCartDetail();
    super.initState();
  }

  ShoesBrand currentBrand = ShoesBrand.All;
  List<Shoes> initalData = [];
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
        body: RefreshIndicator.adaptive(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            context.read<FetchShoesDataCubit>().fetchStoreData();
            return Future.delayed(const Duration(seconds: 1));
          },
          child: NotificationListener<UserScrollNotification>(
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
              physics: const AlwaysScrollableScrollPhysics(),
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
                        initalData.clear();
                        initalData.addAll(state.data);
                        filterData = filterItems(state.data);
                        if (filterData.isNotEmpty) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: filterData[index].name,
                                          child: ItemCardWidget(
                                            data: filterData,
                                            index: index,
                                          ),
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
                        } else {
                          const SliverToBoxAdapter(child: NoDataWidget());
                        }
                      }
                      return const SliverToBoxAdapter(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          NoDataWidget(),
                        ],
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: isVisible
            ? Padding(
                padding:
                    EdgeInsets.symmetric(vertical: Platform.isIOS ? 0 : 20),
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: FloatingActionButton.extended(
                    backgroundColor: AppColors.primaryDark,
                    onPressed: () {
                      showFilterBottomSheet(
                        context: context,
                        shoes: initalData,
                        onChanged: (value) {
                          filterData.clear();
                          for (var val in value) {
                            filterData.add(val);
                          }
                          setState(() {});
                        },
                      );
                    },
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
