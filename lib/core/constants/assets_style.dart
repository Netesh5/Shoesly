import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class CustomIcon {
  static applyStyle(String icon, {Color? color, double? width}) {
    return SvgPicture.asset(
      width: width ?? 24,
      icon,
      colorFilter: ColorFilter.mode(
        color ?? AppColors.primaryDark,
        BlendMode.srcIn,
      ),
    );
  }
}
