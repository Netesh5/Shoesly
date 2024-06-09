import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:priority_soft_ecommerce/core/widgets/shimmer_effect.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/cubit/fetch_shoes_data_cubit.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/homepage_app_bar.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    context.read<FetchShoesDataCubit>().fetchStoreData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const HomepageAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          sliver: BlocBuilder<FetchShoesDataCubit, CommonState>(
            builder: (context, state) {
              if (state is CommonLoadingState) {
                return const CustomShimmerEffect();
              }
              if (state is CommonSuccessState<List<Shoes>>) {
                return SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return CustomCardWidget(
                          child: Image.network(
                        state.data[index].image,
                      ));
                    });
              }
              return const CustomShimmerEffect();
            },
          ),
        )
      ],
    ));
  }
}
