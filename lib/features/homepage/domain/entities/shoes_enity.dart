// ignore_for_file: public_member_api_docs, sort_constructors_first
class Shoes {
  final String name;
  final String description;
  final String rate;
  final num rating;
  final num size;
  final List<Review> review;
  final String brand;
  final String image;
  final String gender;
  final String color;
  Shoes({
    required this.name,
    required this.description,
    required this.rate,
    required this.rating,
    required this.size,
    required this.review,
    required this.brand,
    required this.image,
    required this.gender,
    required this.color,
  });

  Shoes copyWith({
    String? name,
    String? description,
    String? rate,
    num? rating,
    num? size,
    List<Review>? review,
    String? brand,
    String? image,
    String? gender,
    String? color,
  }) {
    return Shoes(
      name: name ?? this.name,
      description: description ?? this.description,
      rate: rate ?? this.rate,
      rating: rating ?? this.rating,
      size: size ?? this.size,
      review: review ?? this.review,
      brand: brand ?? this.brand,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      color: color ?? this.color,
    );
  }
}

class Review {
  final String name;
  final String review;
  final String time;
  final num rating;
  Review({
    required this.name,
    required this.review,
    required this.time,
    required this.rating,
  });
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
        name: map['name'] ?? "",
        review: map['review'] ?? "",
        time: map['time'] ?? "",
        rating: map["rating"] ?? 0);
  }
}
