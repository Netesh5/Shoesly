import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/utils/size_utils.dart';

class AssetStyle {
  static applyStyle(String icon, {Color? color, double? width}) {
    return SvgPicture.asset(
      width: width ?? 24.w,
      icon,
      colorFilter: ColorFilter.mode(
        color ?? AppColors.primaryDark,
        BlendMode.srcIn,
      ),
    );
  }
}
