import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

abstract interface class ShoesRepo {
  Future<Shoes> fetchShoesData();
}
