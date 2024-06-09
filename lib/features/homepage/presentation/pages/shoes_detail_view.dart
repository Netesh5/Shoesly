import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/shoes_detail_body.dart';

class ShoesDetailView extends StatelessWidget {
  const ShoesDetailView({super.key, required this.shoes});
  final Shoes shoes;
  @override
  Widget build(BuildContext context) {
    return ShoesDetailBody(
      shoes: shoes,
    );
  }
}
