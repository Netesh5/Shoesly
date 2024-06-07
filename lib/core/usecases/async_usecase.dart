import 'package:dartz/dartz.dart';
import 'package:priority_soft_ecommerce/core/error/failure.dart';

abstract interface class AsyncUseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}

class NoParams {}
