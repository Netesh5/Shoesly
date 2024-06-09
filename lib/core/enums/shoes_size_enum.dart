// ignore_for_file: constant_identifier_names

enum ShoesSize {
  ThiryNine(shoeSize: 39),
  ThirtyNineHalf(shoeSize: 39.5),
  Fourty(shoeSize: 40),
  FourtyHalf(shoeSize: 40.5),
  FourtyOne(shoeSize: 41);

  final num shoeSize;
  const ShoesSize({required this.shoeSize});
}
