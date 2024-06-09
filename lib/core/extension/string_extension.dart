import 'package:priority_soft_ecommerce/core/extension/num_extension.dart';

extension Captialize on String {
  captialize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get commaForm {
    final parsed = num.parse(this);
    return parsed.formatted;
  }

  String get priceForm {
    return "\$ $commaForm";
  }
}
