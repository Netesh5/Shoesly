import 'package:priority_soft_ecommerce/core/services/firebase/cloud_firestore.dart';
import 'package:priority_soft_ecommerce/features/homepage/data/models/shoes_data_model.dart';

abstract interface class ShoesDataSource {
  Future<List<ShoesModel>> fetchShoesData();
}

class ShoesDataSourceImpl implements ShoesDataSource {
  final CloudFirestoreService cloudFirestoreService;
  ShoesDataSourceImpl({
    required this.cloudFirestoreService,
  });
  @override
  Future<List<ShoesModel>> fetchShoesData() async {
    final res =
        await cloudFirestoreService.firebaseFirestore.collection("shoes").get();
    final data = res.docs.map((e) => e.data()).toList();

    return List.from(data.first["items"])
        .map((e) => ShoesModel.fromSnapshot(e))
        .toList();
  }
}
