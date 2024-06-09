import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/rating_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/review_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/shoes_detail_body.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/size_widget.dart';

class ShoesDetailDescriptionWidget extends StatelessWidget {
  const ShoesDetailDescriptionWidget({
    super.key,
    required this.widget,
  });

  final ShoesDetailBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.shoes.name,
            style: AppTextStyle.headline600,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomRatingWidget(rating: widget.shoes.rating.toDouble()),
              const SizedBox(
                width: 4,
              ),
              Text(
                widget.shoes.rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 4,
              ),
              Text("(${widget.shoes.review.length} Reviews)")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Size",
            style: AppTextStyle.headline400,
          ),
          const SizedBox(
            height: 10,
          ),
          SizeWidget(shoes: widget.shoes),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Description",
            style: AppTextStyle.headline400,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.shoes.description,
            style: AppTextStyle.bodytext200,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Review (${widget.shoes.review.length})",
            style: AppTextStyle.headline400,
          ),
          const SizedBox(
            height: 10,
          ),
          ...List.generate(
            3,
            (index) => ReviewWidget(
              review: widget.shoes.review[index],
              rating: widget.shoes.rating.toDouble(),
            ),
          )
        ],
      ),
    );
  }
}
