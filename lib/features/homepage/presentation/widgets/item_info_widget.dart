import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final List<Shoes> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Text(data[index].name),
            ],
          ),
          Row(
            children: [
              AssetStyle.applyStyle(Assets.star,
                  width: 15, color: AppColors.primaryWarning500),
              const SizedBox(
                width: 10,
              ),
              Text(
                data[index].rating.toString(),
                style: AppTextStyle.heading300,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "(${data[index].review.length} Reviews)",
                style: AppTextStyle.bodytext200,
              ),
            ],
          ),
          Text(
            data[index].rate.priceForm,
            style: AppTextStyle.heading300,
          ),
        ],
      ),
    );
  }
}
