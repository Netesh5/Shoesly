// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:priority_soft_ecommerce/core/error/exception.dart';

import 'package:priority_soft_ecommerce/core/error/failure.dart';
import 'package:priority_soft_ecommerce/core/usecases/async_usecase.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/repositories/shoes_repo.dart';

class FetchShoesDataInteractor implements AsyncUseCase<Shoes, void> {
  final ShoesRepo repo;
  FetchShoesDataInteractor({
    required this.repo,
  });
  @override
  Future<Either<Failure, Shoes>> call(void param) async {
    try {
      final res = await repo.fetchShoesData();
      return Right(res);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
