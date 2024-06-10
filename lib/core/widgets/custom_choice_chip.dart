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
  });
  final String label;
  final int index;
  final ValueChanged<int> valueChange;
  int selectedIndex;

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), side: const BorderSide()),
      label: Text(
        widget.label,
        style: AppTextStyle.heading300.copyWith(
            color: widget.selectedIndex == widget.index
                ? AppColors.primarylight
                : null),
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
