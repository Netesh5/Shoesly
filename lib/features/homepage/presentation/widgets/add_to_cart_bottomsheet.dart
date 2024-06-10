// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_navigation_bar.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/quantity_textform_field_widget.dart';

showAddToBottomSheetCart(
    BuildContext context, Shoes shoes, ValueChanged<int> valueChanged) {
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _ShowAddToCartBottomSheet(
            shoes: shoes,
            valueChanged: valueChanged,
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

  final GlobalKey formKey = GlobalKey<FormState>();

  int qtyValue = 1;
  late Shoes shoe;
  @override
  void initState() {
    shoe = widget.shoes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      rate: (value * int.parse(widget.shoes.rate)).toString());
                  setState(() {});
                },
              ),
              BottomNavigationBarWithButton(
                onChanged: () {},
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
    );
  }
}
