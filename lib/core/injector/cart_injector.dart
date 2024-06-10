import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/features/cart/data/datasources/cart_source.dart';
import 'package:priority_soft_ecommerce/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/add_to_cart_interactor.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/delet_cart_item_interactor.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/fetch_cart_detail_interactor.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/add_to_cart_cubit.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/delete_cart_item_cubit.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/fetch_cart_detail.dart';

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

    DI.instance.registerLazySingleton<FetchCartDetailInteractor>(
        () => FetchCartDetailInteractor(cartRepo: DI.instance()));

    DI.instance
        .registerFactory<FetchCartDetailCubit>(() => FetchCartDetailCubit(
              interactor: DI.instance(),
              deleteCartItemCubit: BlocProvider.of<DeleteCartItemCubit>(
                  NavigationService.context),
            ));

    DI.instance.registerLazySingleton<DeleteCartItemInteractor>(
        () => DeleteCartItemInteractor(cartRepo: DI.instance()));

    DI.instance.registerFactory<DeleteCartItemCubit>(
        () => DeleteCartItemCubit(interactor: DI.instance()));
  }
}
