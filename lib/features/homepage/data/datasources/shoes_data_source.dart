// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:priority_soft_ecommerce/core/services/firesbase/cloud_firestore.dart';
import 'package:priority_soft_ecommerce/features/homepage/data/models/shoes_data_model.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

abstract interface class ShoesDataSource {
  Future<ShoesModel> fetchShoesData();
}

class ShoesDataSourceImpl implements ShoesDataSource {
  final CloudFirestoreService cloudFirestoreService;
  ShoesDataSourceImpl({
    required this.cloudFirestoreService,
  });
  @override
  Future<ShoesModel> fetchShoesData() async {
    final res =
        await cloudFirestoreService.firebaseFirestore.collection("shoes").get();
    print(res.docs.toString());
    return ShoesModel(
        name: "",
        description: "",
        rate: "rate",
        rating: 4,
        size: 41,
        review: Review(name: "", review: "", time: "time"));
  }
}
