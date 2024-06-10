// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

enum ShoesColor {
  Black(colorName: "black", color: Colors.black),
  White(colorName: "white", color: Colors.white),
  Red(colorName: "red", color: AppColors.primaryError500),
  Grey(colorName: "grey", color: Colors.grey),
  Green(colorName: "green", color: Colors.green);

  final String colorName;
  final Color color;
  const ShoesColor({required this.colorName, required this.color});
}
