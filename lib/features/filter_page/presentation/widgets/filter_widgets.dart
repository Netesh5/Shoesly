import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';

class FilterWidgets extends StatelessWidget {
  const FilterWidgets({super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.headline400,
        ),
        const SizedBox(
          height: 20,
        ),
        widget
      ],
    );
  }
}
