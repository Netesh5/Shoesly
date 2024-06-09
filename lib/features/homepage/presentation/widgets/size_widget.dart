// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_size_enum.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key, required this.shoes});
  final Shoes shoes;

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        ShoesSize.values.length,
        (int index) {
          return ChoiceChip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            side: const BorderSide(),
            label: Text(
              ShoesSize.values[index].shoeSize.toString(),
              style: AppTextStyle.heading300.copyWith(
                  color: _selectedChipIndex == index
                      ? AppColors.primarylight
                      : null),
            ),
            selected: _selectedChipIndex == index,
            selectedColor: AppColors.primaryDark,
            onSelected: (bool selected) {
              setState(
                () {
                  _selectedChipIndex = index;
                },
              );
            },
          );
        },
      ).toList(),
    );
  }
}
