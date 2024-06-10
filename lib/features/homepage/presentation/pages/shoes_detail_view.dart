import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/add_to_cart_cubit.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/shoes_detail_body.dart';

class ShoesDetailView extends StatelessWidget {
  const ShoesDetailView({super.key, required this.shoes});
  final Shoes shoes;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DI.instance<AddToCartCubit>(),
      child: ShoesDetailBody(
        shoes: shoes,
      ),
    );
  }
}
