import 'package:priority_soft_ecommerce/features/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel(
      {required super.id,
      required super.name,
      required super.brand,
      required super.size,
      required super.color,
      required super.qty,
      required super.image,
      required super.rate,
      required super.orderTime});

  factory CartModel.fromSnapshot(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      brand: map['brand'] ?? "",
      size: map['size'] as num,
      color: map['color'] ?? "",
      qty: map['qty'] ?? "",
      image: map['image'] ?? "",
      rate: map['rate'] ?? "",
      orderTime: map['orderTime'] ?? 0,
    );
  }
}
