// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class QuantityTextformfieldWidget extends StatefulWidget {
  const QuantityTextformfieldWidget({
    super.key,
    required this.controller,
    required this.valueChanged,
  });

  final TextEditingController controller;
  final ValueChanged<int> valueChanged;
  @override
  State<QuantityTextformfieldWidget> createState() =>
      _QuantityTextformfieldWidgetState();
}

class _QuantityTextformfieldWidgetState
    extends State<QuantityTextformfieldWidget> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryDark,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        widget.controller.text = value;
      },
      decoration: InputDecoration(
          suffix: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (qty > 1) {
                qty--;
                widget.controller.text = qty.toString();
                setState(() {});
                widget.valueChanged(qty);
              }
            },
            icon: Icon(
              Icons.remove_circle_outline,
              color:
                  qty <= 1 ? AppColors.primarylight300 : AppColors.primaryDark,
            ),
          ),
          IconButton(
            onPressed: () {
              qty++;
              widget.controller.text = qty.toString();
              setState(() {});
              widget.valueChanged(qty);
            },
            icon: const Icon(
              Icons.add_circle_outline,
            ),
          ),
        ],
      )),
    );
  }
}
