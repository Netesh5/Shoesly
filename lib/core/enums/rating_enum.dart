// ignore_for_file: constant_identifier_names

enum Rating {
  All(rating: "All", rate: 0),
  FiveStar(rating: "5 Star", rate: 5),
  FourStar(rating: "4 Star", rate: 4),
  ThreeStar(rating: "3 Star", rate: 3),
  TwoStar(rating: "2 Star", rate: 2),
  OneStar(rating: "1 Star", rate: 1);

  final String rating;
  final num rate;

  const Rating({required this.rating, required this.rate});
}
