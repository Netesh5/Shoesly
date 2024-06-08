import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

class ShoesModel extends Shoes {
  ShoesModel({
    required super.name,
    required super.description,
    required super.rate,
    required super.rating,
    required super.size,
    required super.review,
  });

  factory ShoesModel.fromMap(Map<String, dynamic> map) {
    return ShoesModel(
      name: map['name'] as String,
      description: map['description'] as String,
      rate: map['rate'] as String,
      rating: map['rating'] as num,
      size: map['size'] as num,
      review: Review.fromMap(map['review'] as Map<String, dynamic>),
    );
  }
}
