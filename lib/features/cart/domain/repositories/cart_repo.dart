import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';

abstract interface class CartRepo {
  Future<void> addToCart(CartParams params);
}
