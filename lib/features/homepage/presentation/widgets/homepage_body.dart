import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(
            "Discover",
            style:
                AppTextStyle.headline700.copyWith(color: AppColors.primaryDark),
          ),
          expandedHeight: 100,
          pinned: true,
        ),
      ],
    ));
  }
}
