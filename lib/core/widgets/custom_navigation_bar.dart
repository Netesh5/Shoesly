import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/utils/size_utils.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_filled_button.dart';

class BottomNavigationBarWithButton extends StatelessWidget {
  final String title;
  final VoidCallback onChanged;
  final Widget? prefix;
  final bool disableButton;
  final TextStyle? textStyle;
  const BottomNavigationBarWithButton({
    super.key,
    required this.onChanged,
    required this.title,
    this.prefix,
    this.disableButton = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 20,
            bottom:
                context.bottomViewPadding > 0 ? context.bottomViewPadding : 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.primarylight,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              if (prefix != null) prefix!,
              const Spacer(),
              CustomFilledButton(
                containerPadding: EdgeInsets.symmetric(
                  vertical: 12.hp,
                  horizontal: title.length < 12 ? 40.wp : 28.wp,
                ),
                disabled: disableButton,
                containerMargin: EdgeInsets.only(right: 20.wp, top: 20.hp),
                fillColor: AppColors.primaryDark,
                title: title,
                flex: 0,
                onPressed: onChanged,
                titleStyle: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
