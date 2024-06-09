import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final IconData? prefixIcon;
  final Color? prefixColor;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final String title;
  final TextStyle? titleStyle;
  final Color? fillColor;
  final VoidCallback? onPressed;
  final EdgeInsets? containerMargin;
  final EdgeInsets? containerPadding;
  final bool showShadow;
  final double iconSize;
  final bool disabled;

  final int? flex;
  const CustomFilledButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.fillColor,
    this.prefixIcon,
    this.prefixColor,
    this.suffixIcon,
    this.suffixColor,
    this.onPressed,
    this.containerMargin,
    this.containerPadding,
    this.flex = 1,
    this.showShadow = true,
    this.iconSize = 24,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 50,
          width: 156,
          padding: containerPadding ?? const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    prefixIcon,
                    size: iconSize,
                    color: disabled ? AppColors.primarylight300 : prefixColor,
                  ),
                ),
              Expanded(
                flex: flex!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: (titleStyle),
                    ),
                  ],
                ),
              ),
              if (suffixIcon != null)
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    suffixIcon,
                    size: iconSize,
                    color: disabled ? AppColors.primarylight : suffixColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
