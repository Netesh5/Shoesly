import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:priority_soft_ecommerce/core/error/exception.dart';
import 'package:priority_soft_ecommerce/core/error/failure.dart';
import 'package:priority_soft_ecommerce/core/usecases/async_usecase.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';

import 'package:priority_soft_ecommerce/features/cart/domain/repositories/cart_repo.dart';

class FetchCartDetailInteractor implements AsyncUseCase<List<CartModel>, void> {
  final CartRepo cartRepo;
  FetchCartDetailInteractor({
    required this.cartRepo,
  });

  @override
  Future<Either<Failure, List<CartModel>>> call(void params) async {
    try {
      final res = await cartRepo.fetchCartDetail();
      return Right(res);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
