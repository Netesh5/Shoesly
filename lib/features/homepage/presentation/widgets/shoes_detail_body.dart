import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_card_widget.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_navigation_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_round_button.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/indicator_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/shoes_detail_description_widget.dart';

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
        rightPadding: 40,
        actions: [
          CustomIcon.applyStyle(
            Assets.cart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomCardWidget(
                color: AppColors.primarylight100,
                width: 350,
                height: 315,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: widget.shoes.name,
                        child: Image.network(
                          widget.shoes.image,
                          height:
                              widget.shoes.brand == ShoesBrand.Reebok.brandName
                                  ? 205
                                  : null,
                        ),
                      ),
                      ColorIndicatorWidget(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShoesDetailDescriptionWidget(widget: widget),
            Center(
              child: Container(
                  width: 315,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primarylight300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomRoundedButtom(
                      title: "SEE ALL REVIEW",
                      onPressed: () {
                        NavigationService.pushNamed(
                            routeName: Routes.reviewScreen, args: widget.shoes);
                      })),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BottomNavigationBarWithButton(
          onChanged: () {},
          title: "Add to Cart",
          textStyle:
              AppTextStyle.heading300.copyWith(color: AppColors.primarylight),
          prefix: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Price"),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.shoes.rate.priceForm,
                style: AppTextStyle.headline600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
