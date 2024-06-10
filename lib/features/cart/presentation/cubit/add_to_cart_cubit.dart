import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_param.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/add_to_cart_interactor.dart';

class AddToCartCubit extends Cubit<CommonState> {
  AddToCartCubit({required this.interactor}) : super(CommonInitialState());
  AddToCartInteractor interactor;
  addToCart(CartParams params) async {
    emit(CommonLoadingState());
    final res = await interactor(params);
    res.fold((l) => emit(CommonErrorState(message: l.message)),
        (r) => emit(CommonSuccessState(data: "")));
  }
}
