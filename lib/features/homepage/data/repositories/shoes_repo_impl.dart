import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/repositories/shoes_repo.dart';

class ShoesRepoImpl implements ShoesRepo {
  @override
  Future<Shoes> fetchShoesData() {
    throw Shoes(
        name: "",
        description: "",
        rate: "rate",
        rating: 4,
        size: 41,
        review: Review(name: "", review: "", time: "time"));
  }
}
