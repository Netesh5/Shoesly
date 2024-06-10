// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:priority_soft_ecommerce/core/services/firebase/cloud_firestore.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';

abstract interface class CartDatasource {
  Future<void> addToCart(CartParams params);
  Future<List<CartModel>> fetchCartDetail();
  Future<void> deleteCartItem(String id);
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
        .doc(params.id)
        .set(params.toMap());
  }

  @override
  Future<List<CartModel>> fetchCartDetail() async {
    final res =
        await cloudFirestoreService.firebaseFirestore.collection("cart").get();

    final data = res.docs.map((e) => e.data()).toList();
    return List.from(data).map((e) => CartModel.fromSnapshot(e)).toList();
  }

  @override
  Future<void> deleteCartItem(String id) async {
    final _ = await cloudFirestoreService.firebaseFirestore
        .collection("cart")
        .doc(id)
        .delete();
  }
}
