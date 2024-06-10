import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/core/usecases/async_usecase.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/fetch_cart_detail_interactor.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/delete_cart_item_cubit.dart';

class FetchCartDetailCubit extends Cubit<CommonState> {
  FetchCartDetailCubit(
      {required this.interactor, required this.deleteCartItemCubit})
      : super(CommonInitialState()) {
    streamSubscription = deleteCartItemCubit.stream.listen((event) {
      if (state is CommonSuccessState) {
        fetchCartDetail();
      }
    });
  }
  FetchCartDetailInteractor interactor;
  StreamSubscription? streamSubscription;

  DeleteCartItemCubit deleteCartItemCubit;
  fetchCartDetail() async {
    emit(CommonLoadingState());
    final res = await interactor(NoParams());
    res.fold(
        (l) => emit(CommonErrorState(message: l.message)),
        (r) => emit(
              CommonSuccessState(
                data: r,
              ),
            ));
  }
}
