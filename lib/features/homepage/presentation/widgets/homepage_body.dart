import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/utils/size_utils.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/homepage_app_bar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const HomepageAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomCardWidget(
                    child: Image.asset(
                  "assets/images/Nike Shoes Normal.png",
                  fit: BoxFit.contain,
                ));
              }),
        )
      ],
    ));
  }
}
