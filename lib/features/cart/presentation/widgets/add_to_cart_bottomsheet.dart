// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_navigation_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/loading_widget.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/add_to_cart_cubit.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/widgets/cart_success_bottomsheet.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/quantity_textform_field_widget.dart';
import 'package:uuid/uuid.dart';

showAddToBottomSheetCart(
    BuildContext context, Shoes shoes, ValueChanged<int> valueChanged) {
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return BlocProvider(
          create: (context) => DI.instance<AddToCartCubit>(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _ShowAddToCartBottomSheet(
              shoes: shoes,
              valueChanged: valueChanged,
            ),
          ),
        );
      });
}

class _ShowAddToCartBottomSheet extends StatefulWidget {
  const _ShowAddToCartBottomSheet(
      {required this.shoes, required this.valueChanged});
  final Shoes shoes;
  final ValueChanged<int> valueChanged;

  @override
  State<_ShowAddToCartBottomSheet> createState() =>
      _ShowAddToCartBottomSheetState();
}

class _ShowAddToCartBottomSheetState extends State<_ShowAddToCartBottomSheet> {
  final TextEditingController controller = TextEditingController(text: "1");

  final formKey = GlobalKey<FormState>();

  int qtyValue = 1;
  late Shoes shoe;
  @override
  void initState() {
    shoe = widget.shoes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, CommonState>(
      listener: (context, state) {
        if (state is CommonLoadingState) {
          showLoadingDialog(context);
        }
        if (state is CommonSuccessState) {
          NavigationService.pop();
          NavigationService.pop();
          successBottomSheet(context);
        }
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add to cart",
                      style: AppTextStyle.headline600,
                    ),
                    IconButton(
                      onPressed: () {
                        NavigationService.pop();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Quantity",
                  style: AppTextStyle.heading300,
                ),
                QuantityTextformfieldWidget(
                  controller: controller,
                  valueChanged: (value) {
                    shoe = widget.shoes.copyWith(
                        rate:
                            (value * int.parse(widget.shoes.rate)).toString());
                    setState(() {});
                  },
                ),
                BottomNavigationBarWithButton(
                  onChanged: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AddToCartCubit>().addToCart(
                            CartParams(
                              id: const Uuid().v1(),
                              name: widget.shoes.name,
                              brand: widget.shoes.brand,
                              size: widget.shoes.size,
                              color: widget.shoes.color.toString(),
                              qty: controller.text,
                              image: widget.shoes.image,
                              rate: shoe.rate,
                              orderTime: DateTime.now().millisecondsSinceEpoch,
                            ),
                          );
                    }
                  },
                  title: "Add to Cart",
                  textStyle: AppTextStyle.heading300
                      .copyWith(color: AppColors.primarylight),
                  prefix: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Price"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        shoe.rate.priceForm,
                        style: AppTextStyle.headline600,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
