// ignore_for_file: constant_identifier_names

import 'package:priority_soft_ecommerce/core/constants/assets.dart';

enum ShoesBrand {
  All(brandName: "all", logo: ""),
  Nike(brandName: "nike", logo: Assets.nikeBlack),
  Jordan(brandName: "jordan", logo: Assets.jordanBlack),
  Adidas(brandName: "adidas", logo: Assets.adidasBlack),
  Reebok(brandName: "reebok", logo: Assets.reebokBlack);

  final String brandName;
  final String logo;
  const ShoesBrand({required this.brandName, required this.logo});
}
