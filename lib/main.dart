import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft_ecommerce/core/injector/injector.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/routes/routes_generator.dart';

import 'package:priority_soft_ecommerce/core/themes/app_theme.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/delete_cart_item_cubit.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/fetch_cart_detail.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/pages/homepage_view.dart';
import 'package:priority_soft_ecommerce/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DI.instance<FetchCartDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => DI.instance<DeleteCartItemCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.routeGenerator,
        navigatorKey: NavigationService.navigationKey,
        home: const HomePageView(),
      ),
    );
  }
}
