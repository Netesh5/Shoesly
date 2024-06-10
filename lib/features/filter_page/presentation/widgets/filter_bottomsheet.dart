import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/features/filter_page/presentation/widgets/filter_page_body.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

showFilterBottomSheet(BuildContext context, List<Shoes> shoes) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FilterPageBody(
          shoes: shoes,
        );
      });
}
