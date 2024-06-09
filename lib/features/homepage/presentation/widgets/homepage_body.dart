import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
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
  @override
  void initState() {
    context.read<FetchShoesDataCubit>().fetchStoreData();
    // CloudFirestoreService().uplodImage();
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
        body: CustomScrollView(
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
                        // if (currentIndex == 0) {
                        //   data.clear();
                        //   data.addAll(state.data);
                        // }
                        // if (currentIndex == 1) {
                        //   data.clear();
                        //   data = state.data
                        //       .where((element) =>
                        //           element.brand == ShoesBrand.Nike.brandName)
                        //       .toList();
                        // }
                        // if (currentIndex == 2) {
                        //   data.clear();
                        //   data = state.data
                        //       .where((element) =>
                        //           element.brand == ShoesBrand.Jordan.brandName)
                        //       .toList();
                        // }
                        // if (currentIndex == 3) {
                        //   data.clear();
                        //   data = state.data
                        //       .where((element) =>
                        //           element.brand == ShoesBrand.Adidas.brandName)
                        //       .toList();
                        // }
                        // if (currentIndex == 4) {
                        //   data.clear();
                        //   data = state.data
                        //       .where((element) =>
                        //           element.brand == ShoesBrand.Reebok.brandName)
                        //       .toList();
                        // }

                        return Column(
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
                        );
                      }),
                );
              }
              return const CustomShimmerEffect();
            },
          ),
        )
      ],
    ));
  }
}
