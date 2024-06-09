import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const HomepageAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(),
          sliver: BlocBuilder<FetchShoesDataCubit, CommonState>(
            builder: (context, state) {
              if (state is CommonLoadingState) {
                return const CustomShimmerEffect();
              }
              if (state is CommonSuccessState<List<Shoes>>) {
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
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final data = state.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ItemCardWidget(
                              data: data,
                              index: index,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ItemInfoWidget(
                              data: data,
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
