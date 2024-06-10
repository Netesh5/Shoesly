import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/utils/calculate_total.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_navigation_bar.dart';

import 'package:priority_soft_ecommerce/core/widgets/no_data_widget.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/delete_cart_item_cubit.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/fetch_cart_detail.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/widgets/cart_info_widget.dart';

class CartDetailBody extends StatefulWidget {
  const CartDetailBody({super.key});

  @override
  State<CartDetailBody> createState() => _CartDetailBodyState();
}

class _CartDetailBodyState extends State<CartDetailBody> {
  @override
  void initState() {
    context.read<FetchCartDetailCubit>().fetchCartDetail();
    super.initState();
  }

  List<CartModel> intitalData = [];
  double totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
        showShadow: false,
        centerMiddle: true,
      ),
      body: BlocListener<FetchCartDetailCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonLoadingState) {}
          if (state is CommonSuccessState<List<CartModel>>) {
            totalPrice = calculateTotalPrice(state.data);
            setState(() {});
          }
        },
        child: BlocBuilder<FetchCartDetailCubit, CommonState>(
          builder: (context, state) {
            if (state is CommonSuccessState<List<CartModel>>) {
              if (state.data.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    intitalData.clear();
                    final data = state.data[index];
                    intitalData.addAll(state.data);
                    return Slidable(
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            context
                                .read<DeleteCartItemCubit>()
                                .deleteCartItem(data.id);
                          },
                          backgroundColor: AppColors.primaryError500,
                          foregroundColor: Colors.white,
                          icon: CupertinoIcons.delete,
                        ),
                      ]),
                      child: CartInfoWidget(data: data),
                    );
                  },
                  itemCount: state.data.length,
                );
              } else {
                return const NoDataWidget();
              }
            }

            return const NoDataWidget();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BottomNavigationBarWithButton(
          onChanged: () {
            NavigationService.pushNamed(
                routeName: Routes.orderSummaryScreen, args: intitalData);
          },
          title: "Go to Checkout",
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
                totalPrice.toString().priceForm,
                style: AppTextStyle.headline600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
