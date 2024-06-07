import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:priority_soft_ecommerce/core/constants/icons_assets.dart';
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Discover",
                  style: AppTextStyle.headline700.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  width: 24,
                  AppIcons.cart,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
          ),
          expandedHeight: 100,
          pinned: true,
        ),
      ],
    ));
  }
}
