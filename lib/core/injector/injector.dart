import 'package:get_it/get_it.dart';
import 'package:priority_soft_ecommerce/core/injector/cart_injector.dart';
import 'package:priority_soft_ecommerce/core/injector/shoes_injector.dart';

class DI {
  static final instance = GetIt.instance;
  static init() async {
    await ShoesInjector.init();
    await CartInjector.init();
  }
}
