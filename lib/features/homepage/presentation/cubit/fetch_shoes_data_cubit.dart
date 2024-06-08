import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/usecases/async_usecase.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/usecases/fetch_shoes_interactor.dart';

class FetchShoesDataCubit extends Cubit<CommonState> {
  FetchShoesDataCubit({required this.interactor}) : super(CommonInitialState());
  FetchShoesDataInteractor interactor;
  fetchStoreData() async {
    emit(CommonLoadingState());
    final res = await interactor(NoParams());
    res.fold((l) => emit(CommonErrorState(message: l.message)),
        (r) => emit(CommonSuccessState(data: r)));
  }
}
