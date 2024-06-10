// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:priority_soft_ecommerce/core/services/firebase/cloud_firestore.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';

abstract interface class CartDatasource {
  Future<void> addToCart(CartParams params);
}

class CartDataSourceImpl implements CartDatasource {
  final CloudFirestoreService cloudFirestoreService;
  CartDataSourceImpl({
    required this.cloudFirestoreService,
  });
  @override
  Future<void> addToCart(CartParams params) async {
    final _ = await cloudFirestoreService.firebaseFirestore
        .collection("cart")
        .doc()
        .set(params.toMap());
  }
}
