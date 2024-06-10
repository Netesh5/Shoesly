import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

double calculateAverageRating(List<Review> reviews) {
  if (reviews.isEmpty) return 0.0;

  double totalRating = reviews.fold(0.0, (sum, review) => sum + review.rating);
  return totalRating / reviews.length;
}
