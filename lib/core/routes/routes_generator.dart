import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/pages/cart_view.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/pages/order_summary_view.dart';

import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/pages/homepage_view.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/pages/shoes_detail_view.dart';
import 'package:priority_soft_ecommerce/features/review/presentation/pages/review_view.dart';

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
      case Routes.reviewScreen:
        return MaterialPageRoute(
          builder: (context) => ReviewView(
            shoes: setting.arguments as Shoes,
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartDetailView(),
        );
      case Routes.orderSummaryScreen:
        return MaterialPageRoute(
          builder: (context) => OrderSummaryView(
            cartModel: setting.arguments as List<CartModel>,
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const HomePageView());
    }
  }
}
