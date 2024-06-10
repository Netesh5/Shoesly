// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:priority_soft_ecommerce/features/cart/data/datasources/cart_source.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  CartDatasource cartDatasource;
  CartRepoImpl({
    required this.cartDatasource,
  });
  @override
  Future<void> addToCart(CartParams params) async {
    final _ = await cartDatasource.addToCart(params);
  }
}
