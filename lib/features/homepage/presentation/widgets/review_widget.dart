import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/rating_widget.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.review,
    required this.rating,
  });

  final Review review;

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/nolan.png"),
          radius: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.name),
            const SizedBox(
              height: 10,
            ),
            CustomRatingWidget(rating: rating),
            const SizedBox(
              height: 10,
            ),
            Text(
              review.review,
              style: AppTextStyle.bodytext100,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
