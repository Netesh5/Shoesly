import 'package:intl/intl.dart';

extension NumExt on num {
  String get formatted {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 2,
    );
    return formatter.format(this);
  }
}
