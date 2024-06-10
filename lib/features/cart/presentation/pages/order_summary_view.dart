import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/widgets/order_summary_body.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({super.key, required this.cartModel});
  final List<CartModel> cartModel;
  @override
  Widget build(BuildContext context) {
    return OrderSummaryBody(
      cartModel: cartModel,
    );
  }
}
