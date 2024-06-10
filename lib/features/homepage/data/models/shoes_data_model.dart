import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

class ShoesModel extends Shoes {
  ShoesModel({
    required super.name,
    required super.description,
    required super.rate,
    required super.rating,
    required super.size,
    required super.review,
    required super.brand,
    required super.image,
    required super.gender,
    required super.color,
  });

  factory ShoesModel.fromSnapshot(Map<String, dynamic> json) {
    final data = json;
    return ShoesModel(
      name: data["name"],
      description: data['description'] ?? "",
      rate: data['price'] ?? "",
      rating: data['rating'] ?? 0,
      size: data['size'] ?? 0,
      review: List.from(data['review'] ?? [])
          .map((e) => Review.fromMap(e))
          .toList(),
      brand: data['brand'] ?? "",
      image: data["image"] ?? "",
      gender: data["gender"] ?? "",
      color: data["color"] ?? "",
    );
  }
}
