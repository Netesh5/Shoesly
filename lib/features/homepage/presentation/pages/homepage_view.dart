import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/cubit/fetch_shoes_data_cubit.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/homepage_body.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchShoesDataCubit>(
      create: (context) => DI.instance<FetchShoesDataCubit>(),
      child: const HomePageBody(),
    );
  }
}
