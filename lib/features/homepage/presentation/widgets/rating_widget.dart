import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return PannableRatingBar(
      rate: rating,
      items: List.generate(
        5,
        (index) => RatingWidget(
          child: CustomIcon.applyStyle(Assets.star, width: 14),
          unSelectedColor: AppColors.primarylight200,
        ),
      ),
    );
  }
}
