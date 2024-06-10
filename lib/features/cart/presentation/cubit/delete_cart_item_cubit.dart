import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';
import 'package:priority_soft_ecommerce/features/cart/domain/usecases/delet_cart_item_interactor.dart';

class DeleteCartItemCubit extends Cubit<CommonState> {
  DeleteCartItemCubit({required this.interactor}) : super(CommonInitialState());
  DeleteCartItemInteractor interactor;
  deleteCartItem(String id) async {
    emit(CommonLoadingState());
    final res = await interactor(id);
    res.fold((l) => emit(CommonErrorState(message: l.message)),
        (r) => emit(CommonSuccessState(data: "")));
  }
}
