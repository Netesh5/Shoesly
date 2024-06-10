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
