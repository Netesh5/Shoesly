import 'package:flutter/widgets.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

abstract class AppTextStyle {
  /// headline900 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 70px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline900 = TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 70,
      height: 1.5,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.7,
      color: AppColors.primaryDark);

  /// headline900 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 48px
  /// height: 58px
  /// fontWeight: 700
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline90048 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 48,
    height: 1.21,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.48,
  );

  /// headline800 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 36px
  /// height: 46px
  /// fontWeight: 600
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline800 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 36,
    height: 1.28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.36,
  );

  /// headline700 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 30px
  /// height: 45px
  /// fontWeight: 700
  /// letterSpacing: 0.3px
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline700 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 30,
    height: 1.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
  );

  /// headline700 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 24px
  /// height: 34px
  /// fontWeight: 600
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline70024 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 24,
    height: 1.42,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
  );

  /// headline600 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 20px
  /// height: 30px
  /// fontWeight: 700
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline600 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
  );

  /// headline500 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 18px
  /// height: 26px
  /// fontWeight: 700
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline500 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 18,
    height: 1.44,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.18,
  );

  /// headline400 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 16px
  /// height: 26px
  /// fontWeight: 600
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline400 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 16,
    height: 1.63,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.16,
  );

  /// headline300 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 14px
  /// height: 24px
  /// fontWeight: 700
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline300 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 14,
    height: 1.71,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.14,
  );

  /// headline200 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 12px
  /// height: 22px
  /// fontWeight: 700
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline200 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 12,
    height: 1.83,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.12,
  );

  /// headline100 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 10px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle headline100 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 10,
    height: 2,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  /// heading300 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 14px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle heading300 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.14,
  );

  /// heading200 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 12px
  /// height: 22px
  /// fontWeight: 600
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle heading200 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 12,
    height: 1.83,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.12,
  );

  /// heading100 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 10px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle heading100 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 10,
    height: 2,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  /// bodytext300 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 16px
  /// height: 26px
  /// fontWeight: 400
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle bodytext300 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 16,
    height: 1.63,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.16,
  );

  /// bodytext200 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 14px
  /// height: 24px
  /// fontWeight: 400
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle bodytext200 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 14,
    height: 1.71,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.14,
  );

  /// bodytext100 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 12px
  /// height: 22px
  /// fontWeight: 400
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle bodytext100 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 12,
    height: 1.83,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.12,
  );

  /// bodytext10 figma properties
  /// fontFamily: Urbanist
  /// fontSize: 11px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: 1%
  /// fontStyle: none
  /// decoration: none
  static TextStyle bodytext10 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 11,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.11,
  );
}
