import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

class ShoesDetailBody extends StatefulWidget {
  const ShoesDetailBody({super.key, required this.shoes});

  final Shoes shoes;
  @override
  State<ShoesDetailBody> createState() => _ShoesDetailBodyState();
}

class _ShoesDetailBodyState extends State<ShoesDetailBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          showShadow: false,
          showBackButton: true,
          actions: [
            CustomIcon.applyStyle(
              Assets.cart,
            ),
          ],
        ),
        body: Column(
          children: [
            CustomCardWidget(
              width: 315,
              height: 315,
              child: Image.network(
                widget.shoes.image,
              ),
            )
          ],
        ));
  }
}
