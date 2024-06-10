import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';

double calculateTotalPrice(List<CartModel> data) {
  if (data.isEmpty) return 0.0;

  double totalPrice = data.fold(0.0, (sum, rate) => sum + num.parse(rate.rate));
  return totalPrice;
}
