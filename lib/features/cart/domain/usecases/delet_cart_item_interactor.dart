import 'package:dartz/dartz.dart';
import 'package:priority_soft_ecommerce/core/error/exception.dart';
import 'package:priority_soft_ecommerce/core/error/failure.dart';
import 'package:priority_soft_ecommerce/core/usecases/async_usecase.dart';

import 'package:priority_soft_ecommerce/features/cart/domain/repositories/cart_repo.dart';

class DeleteCartItemInteractor implements AsyncUseCase<void, String> {
  final CartRepo cartRepo;
  DeleteCartItemInteractor({
    required this.cartRepo,
  });
  @override
  Future<Either<Failure, void>> call(String id) async {
    try {
      final _ = await cartRepo.deletCartItem(id);
      return Right(_);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
