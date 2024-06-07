import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: false,
        fontFamily: 'Urbanist',
        primaryColor: AppColors.primarylight,
        appBarTheme: AppBarTheme(
          color: AppColors.primarylight,
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyle.headline900,
          titleMedium: AppTextStyle.bodytext300,
        ),
      );
}
