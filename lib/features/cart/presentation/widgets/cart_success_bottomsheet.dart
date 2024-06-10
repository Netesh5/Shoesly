import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/utils/size_utils.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_filled_button.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_round_button.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/fetch_cart_detail.dart';

successBottomSheet(BuildContext context, {String? title}) {
  return showModalBottomSheet(
      isDismissible: false,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return _SuccessBottomSheet(
          title: title,
        );
      });
}

class _SuccessBottomSheet extends StatelessWidget {
  const _SuccessBottomSheet({this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Icon(
              Icons.check_circle_outline_rounded,
              size: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title ?? "Added to cart",
            style: AppTextStyle.headline700,
          ),
          const SizedBox(
            height: 10,
          ),
          title == null
              ? Text(
                  "1 Item total",
                  style: AppTextStyle.bodytext200
                      .copyWith(color: AppColors.primarylight300),
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: AppColors.primarylight300),
                  ),
                  child: CustomRoundedButtom(
                      title: "BACK EXPLORE",
                      textStyle: AppTextStyle.heading300,
                      onPressed: () {
                        context.read<FetchCartDetailCubit>().fetchCartDetail();
                        NavigationService.popUntilFirstPage();
                      })),
              CustomFilledButton(
                title: title == null ? "GO TO CART" : "DONE",
                titleStyle: AppTextStyle.heading300
                    .copyWith(color: AppColors.primarylight),
                containerPadding: EdgeInsets.symmetric(
                    vertical: 12.hp, horizontal: title == null ? 35.wp : 55.wp),
                fillColor: AppColors.primaryDark,
                onPressed: () {
                  title == null
                      ? NavigationService.popAndPushNamed(
                          routeName: Routes.cartScreen)
                      : NavigationService.popUntilFirstPage();
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
