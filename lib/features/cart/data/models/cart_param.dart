import 'package:priority_soft_ecommerce/features/cart/domain/entities/cart.dart';

class CartParams extends Cart {
  CartParams({
    required super.id,
    required super.name,
    required super.brand,
    required super.size,
    required super.color,
    required super.qty,
    required super.image,
    required super.rate,
    required super.orderTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'brand': brand,
      'size': size,
      'color': color,
      'qty': qty,
      'image': image,
      'rate': rate,
      'orderTime': orderTime,
    };
  }
}
