import 'package:dartz/dartz.dart';
import 'package:priority_soft_ecommerce/core/error/exception.dart';
import 'package:priority_soft_ecommerce/core/error/failure.dart';
import 'package:priority_soft_ecommerce/core/usecases/async_usecase.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/repositories/cart_repo.dart';

class AddToCartInteractor implements AsyncUseCase<void, CartParams> {
  final CartRepo cartRepo;
  AddToCartInteractor({
    required this.cartRepo,
  });
  @override
  Future<Either<Failure, void>> call(CartParams param) async {
    try {
      final _ = await cartRepo.addToCart(param);
      return Right(_);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
