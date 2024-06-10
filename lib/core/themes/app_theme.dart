import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.primarylight,
        useMaterial3: false,
        fontFamily: 'urbanist',
        primaryColor: AppColors.primarylight,
        appBarTheme: AppBarTheme(
          color: AppColors.primarylight,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primarylight,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyle.headline900,
          titleMedium: AppTextStyle.bodytext300,
        ),
        colorScheme: ColorScheme.light(
          background: AppColors.primarylight,
        ).copyWith(
          background: AppColors.primarylight,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.primarylight,
          labelStyle: AppTextStyle.headline600.copyWith(
            color: AppColors.primarylight300,
          ),
          secondaryLabelStyle: AppTextStyle.headline600.copyWith(
            color: AppColors.primaryDark,
          ),
          selectedColor: AppColors.primarylight,
        ),
        inputDecorationTheme: InputDecorationTheme(
            // labelStyle: AppTextStyle.bodytext200.copyWith(
            //   color: AppColors.primaryDark,
            // ),
            // activeIndicatorBorder: BorderSide(
            //   color: AppColors.primaryDark,
            // ),
            focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryDark,
          ),
        )),
        focusColor: AppColors.primaryDark,
      );
}
