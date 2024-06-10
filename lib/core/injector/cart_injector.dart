import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/features/cart/data/datasources/cart_source.dart';
import 'package:priority_soft_ecommerce/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/add_to_cart_interactor.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/add_to_cart_cubit.dart';

class CartInjector {
  static init() {
    //Repo

    DI.instance.registerLazySingleton<CartDatasource>(
        () => CartDataSourceImpl(cloudFirestoreService: DI.instance()));
    DI.instance.registerLazySingleton<CartRepo>(
        () => CartRepoImpl(cartDatasource: DI.instance()));

    DI.instance.registerLazySingleton<AddToCartInteractor>(
        () => AddToCartInteractor(cartRepo: DI.instance()));

    DI.instance.registerFactory<AddToCartCubit>(
        () => AddToCartCubit(interactor: DI.instance()));
  }
}
