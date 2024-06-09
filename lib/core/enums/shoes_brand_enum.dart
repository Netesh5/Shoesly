// ignore_for_file: constant_identifier_names
enum ShoesBrand {
  All(brandName: "all"),
  Nike(brandName: "nike"),
  Jordan(brandName: "jordan"),
  Adidas(brandName: "adidas"),
  Reebok(brandName: "reebok");

  final String brandName;
  const ShoesBrand({required this.brandName});
}
