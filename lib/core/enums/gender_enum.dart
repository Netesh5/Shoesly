// ignore_for_file: constant_identifier_names

enum Gender {
  Male(gender: "male"),
  Female(gender: "female"),
  Unisex(gender: "unisex");

  final String gender;
  const Gender({required this.gender});
}
