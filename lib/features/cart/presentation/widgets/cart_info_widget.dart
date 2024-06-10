import 'package:flutter/widgets.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';

class CartInfoWidget extends StatelessWidget {
  const CartInfoWidget({
    super.key,
    required this.data,
  });

  final CartModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CustomCardWidget(
            width: 88,
            height: 88,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(data.image),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: AppTextStyle.headline400,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${data.name}  ${data.color.captialize()}  ${data.size}",
                style: AppTextStyle.bodytext100.copyWith(
                  color: AppColors.primarylight400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    data.rate.priceForm,
                    style: AppTextStyle.headline400,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
