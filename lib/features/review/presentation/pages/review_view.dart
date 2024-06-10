import 'package:flutter/material.dart';

import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/review/presentation/widgets/review_body.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({
    super.key,
    required this.shoes,
  });
  final Shoes shoes;
  @override
  Widget build(BuildContext context) {
    return ReviewBody(
      shoes: shoes,
    );
  }
}
