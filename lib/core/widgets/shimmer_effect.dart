import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerEffect extends StatelessWidget {
  const CustomShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: AppColors.primarylight,
              highlightColor: AppColors.primarylight200,
              child: const CustomCardWidget(child: SizedBox()),
            );
          }),
    );
  }
}
