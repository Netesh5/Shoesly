class Shoes {
  final String name;
  final String description;
  final String rate;
  final num rating;
  final num size;
  final Review review;
  Shoes({
    required this.name,
    required this.description,
    required this.rate,
    required this.rating,
    required this.size,
    required this.review,
  });
}

class Review {
  final String name;
  final String review;
  final String time;
  Review({
    required this.name,
    required this.review,
    required this.time,
  });
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      name: map['name'] as String,
      review: map['review'] as String,
      time: map['time'] as String,
    );
  }
}
