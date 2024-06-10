// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';

class CustomChoiceChip extends StatefulWidget {
  CustomChoiceChip({
    super.key,
    required this.index,
    required this.label,
    required this.valueChange,
    required this.selectedIndex,
    this.backgroundColor,
    this.suffix,
  });
  final String label;
  final int index;
  final ValueChanged<int> valueChange;
  int selectedIndex;
  Color? backgroundColor;
  Widget? suffix;

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: widget.backgroundColor ?? AppColors.primaryDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
              color: widget.selectedIndex == widget.index
                  ? AppColors.primaryDark
                  : AppColors.primarylight200)),
      label: widget.suffix == null
          ? Text(
              widget.label,
              style: AppTextStyle.heading300.copyWith(
                  color: widget.selectedIndex == widget.index
                      ? AppColors.primarylight
                      : null),
            )
          : Row(
              children: [
                widget.suffix!,
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.label,
                  style: AppTextStyle.heading300.copyWith(
                      color: widget.selectedIndex == widget.index
                          ? AppColors.primaryDark
                          : null),
                )
              ],
            ),
      selected: widget.selectedIndex == widget.index,
      onSelected: (value) {
        widget.selectedIndex = widget.index;
        setState(() {});
        widget.valueChange(widget.selectedIndex);
      },
    );
  }
}
