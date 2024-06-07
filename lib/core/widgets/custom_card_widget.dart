import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key, required this.child, this.color, this.borderRadius});
  final Color? color;
  final double? borderRadius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? AppColors.primarylight200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? 20,
        ),
      ),
      child: child,
    );
  }
}
