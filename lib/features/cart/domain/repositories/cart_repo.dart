import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';

abstract interface class CartRepo {
  Future<void> addToCart(CartParams params);

  Future<List<CartModel>> fetchCartDetail();

  Future<void> deletCartItem(id);
}
