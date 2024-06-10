// ignore_for_file: constant_identifier_names

enum SortBy {
  MostRecent(sortBy: "Most Recent"),
  LowestPrice(sortBy: "Lowest Price"),
  HighestPrice(sortBy: "Highest Price");

  final String sortBy;
  const SortBy({required this.sortBy});
}
