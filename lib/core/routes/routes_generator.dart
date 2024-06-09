import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/pages/homepage_view.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/pages/shoes_detail_view.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings setting) {
    switch (setting.name) {
      case Routes.homepage:
        return MaterialPageRoute(builder: (context) => const HomePageView());
      case Routes.detailScreen:
        return MaterialPageRoute(
          builder: (context) => ShoesDetailView(
            shoes: setting.arguments as Shoes,
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const HomePageView());
    }
  }
}
