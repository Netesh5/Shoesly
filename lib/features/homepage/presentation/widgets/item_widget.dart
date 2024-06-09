import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final List<Shoes> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Stack(
        children: [
          Center(
            child: Image.network(
              data[index].image,
            ),
          ),
          Positioned(
            top: 14,
            child: Column(
              children: [
                if (data[index].brand == ShoesBrand.Jordan.brandName)
                  CustomIcon.applyStyle(
                    Assets.jordanGrey,
                    color: AppColors.primarylight300,
                    width: 24,
                  ),
                if (data[index].brand == ShoesBrand.Adidas.brandName)
                  CustomIcon.applyStyle(
                    Assets.adidasGrey,
                    color: AppColors.primarylight300,
                    width: 24,
                  ),
                if (data[index].brand == ShoesBrand.Reebok.brandName)
                  CustomIcon.applyStyle(
                    Assets.reebokGrey,
                    color: AppColors.primarylight300,
                    width: 30,
                  ),
                if (data[index].brand == ShoesBrand.Nike.brandName)
                  CustomIcon.applyStyle(
                    Assets.nikeGrey,
                    color: AppColors.primarylight300,
                    width: 24,
                  ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
