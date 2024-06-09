import 'package:flutter/material.dart';

import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final Widget? centerWidget;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? tabBackgroundColor;
  final String? title;
  final bool showBottomBorder;
  final Function()? onBackPressed;
  final bool showBackButton;
  final bool centerMiddle;
  final double? leftPadding;
  final double? rightPadding;
  final double topPadding;
  final bool showShadow;
  final Color? backButtonColor;
  const CustomAppBar({
    super.key,
    this.centerWidget,
    this.leadingIcon,
    this.bottom,
    this.backgroundColor,
    this.tabBackgroundColor,
    this.title,
    this.actions = const [],
    this.showBottomBorder = true,
    this.onBackPressed,
    this.centerMiddle = false,
    this.showBackButton = true,
    this.leftPadding,
    this.rightPadding,
    this.topPadding = 4,
    this.showShadow = true,
    this.backButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 0),
              color: AppColors.primarylight300,
              blurRadius: 4,
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(
                left: leftPadding ?? 20,
                right: rightPadding ?? 20,
                top: MediaQuery.of(context).padding.top + topPadding,
              ),
              decoration: BoxDecoration(
                color: backgroundColor ?? theme.scaffoldBackgroundColor,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 70),
                child: NavigationToolbar(
                  leading: CustomIconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      widget: const Icon(
                        Icons.arrow_back_outlined,
                        size: 26,
                        weight: 16,
                      )),
                  middle: title != null
                      ? Text(
                          title ?? "",
                          style: AppTextStyle.headline400,
                        )
                      : centerWidget,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
                  ),
                  centerMiddle: centerMiddle,
                  middleSpacing: NavigationToolbar.kMiddleSpacing,
                ),
              ),
            ),
          ),
          if (bottom != null)
            Container(
              color: tabBackgroundColor,
              child: bottom!,
            )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
