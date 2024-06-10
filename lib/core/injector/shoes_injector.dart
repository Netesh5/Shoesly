import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/core/services/firebase/cloud_firestore.dart';
import 'package:priority_soft_ecommerce/features/homepage/data/datasources/shoes_data_source.dart';
import 'package:priority_soft_ecommerce/features/homepage/data/repositories/shoes_repo_impl.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/repositories/shoes_repo.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/usecases/fetch_shoes_interactor.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/cubit/fetch_shoes_data_cubit.dart';

class ShoesInjector {
  static init() {
    DI.instance.registerLazySingleton(() => CloudFirestoreService());

    //Repo

    DI.instance.registerLazySingleton<ShoesDataSource>(
        () => ShoesDataSourceImpl(cloudFirestoreService: DI.instance()));
    DI.instance.registerLazySingleton<ShoesRepo>(
        () => ShoesRepoImpl(dataSource: DI.instance()));

    DI.instance.registerLazySingleton<FetchShoesDataInteractor>(
        () => FetchShoesDataInteractor(repo: DI.instance()));

    DI.instance.registerFactory<FetchShoesDataCubit>(
        () => FetchShoesDataCubit(interactor: DI.instance()));
  }
}
