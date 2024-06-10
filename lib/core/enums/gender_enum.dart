// ignore_for_file: constant_identifier_names

enum Gender {
  Male(gender: "Male"),
  Female(gender: "Female"),
  Unisex(gender: "Unisex");

  final String gender;
  const Gender({required this.gender});
}
