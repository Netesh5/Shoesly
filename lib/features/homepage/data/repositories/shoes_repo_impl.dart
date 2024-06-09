// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:priority_soft_ecommerce/features/homepage/data/datasources/shoes_data_source.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/repositories/shoes_repo.dart';

class ShoesRepoImpl implements ShoesRepo {
  final ShoesDataSource dataSource;
  ShoesRepoImpl({
    required this.dataSource,
  });
  @override
  Future<List<Shoes>> fetchShoesData() async {
    final res = await dataSource.fetchShoesData();
    return res;
  }
}
