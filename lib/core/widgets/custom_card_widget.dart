import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key,
      required this.child,
      this.color,
      this.borderRadius,
      this.height,
      this.width});
  final Color? color;
  final double? borderRadius;
  final Widget child;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 200,
      width: width ?? 200,
      child: Card(
        color: color ?? AppColors.primarylight200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 20,
          ),
        ),
        child: child,
      ),
    );
  }
}
