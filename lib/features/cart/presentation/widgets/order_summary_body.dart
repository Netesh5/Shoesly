import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';

import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/utils/calculate_total.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_navigation_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/loading_widget.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/delete_cart_item_cubit.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/widgets/cart_success_bottomsheet.dart';

class OrderSummaryBody extends StatelessWidget {
  const OrderSummaryBody({super.key, required this.cartModel});
  final List<CartModel> cartModel;

  @override
  Widget build(BuildContext context) {
    final totalPrice = calculateTotalPrice(cartModel);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Order Summary",
        centerMiddle: true,
        showShadow: false,
      ),
      body: BlocListener<DeleteCartItemCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonLoadingState) {
            showLoadingDialog(context);
          }
          if (state is CommonSuccessState) {
            NavigationService.pop();
            successBottomSheet(
              context,
              title: "Payment completed",
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information",
                  style: AppTextStyle.headline500,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Payment Method", style: AppTextStyle.heading300),
                  subtitle: Text("Credit Cart",
                      style: AppTextStyle.bodytext200
                          .copyWith(color: AppColors.primarylight400)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Divider(
                  color: AppColors.primarylight300,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Nepal", style: AppTextStyle.heading300),
                  subtitle: Text("Kathmandu",
                      style: AppTextStyle.bodytext200
                          .copyWith(color: AppColors.primarylight400)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Order Detail",
                  style: AppTextStyle.headline500,
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                    cartModel.length,
                    (index) => OrderDetailWidget(
                          title: cartModel[index].name,
                          subTitle:
                              "${cartModel[index].brand}  ${cartModel[index].color}  ${cartModel[index].size}  ${cartModel[index].qty}",
                          price: cartModel[index].rate,
                        )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Payment Detail",
                  style: AppTextStyle.headline500,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Subtotal",
                        style: AppTextStyle.bodytext200
                            .copyWith(color: AppColors.primarylight400)),
                    trailing: Text(
                      totalPrice.toString().priceForm,
                      style: AppTextStyle.headline400,
                    )),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Shipping",
                        style: AppTextStyle.bodytext200
                            .copyWith(color: AppColors.primarylight400)),
                    trailing: Text(
                      "20".priceForm,
                      style: AppTextStyle.headline400,
                    )),
                Divider(
                  color: AppColors.primarylight400,
                ),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Total Order",
                        style: AppTextStyle.bodytext200
                            .copyWith(color: AppColors.primarylight400)),
                    trailing: Text(
                      (totalPrice + 20).toString().priceForm,
                      style: AppTextStyle.headline400,
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BottomNavigationBarWithButton(
          onChanged: () {
            for (var element in cartModel) {
              context.read<DeleteCartItemCubit>().deleteCartItem(element.id);
            }
          },
          title: "Payment",
          textStyle:
              AppTextStyle.heading300.copyWith(color: AppColors.primarylight),
          prefix: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Price"),
              const SizedBox(
                height: 5,
              ),
              Text(
                (totalPrice + 20).toString().priceForm,
                style: AppTextStyle.headline600,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price});
  final String title;
  final String subTitle;
  final String price;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyle.headline400,
      ),
      subtitle: Text(
        subTitle,
        style:
            AppTextStyle.bodytext200.copyWith(color: AppColors.primarylight400),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [Text(price.priceForm, style: AppTextStyle.heading300)],
      ),
    );
  }
}
