// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/cubit/common_state.dart';

import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/navigation/navigation_service.dart';
import 'package:priority_soft_ecommerce/core/routes/routes.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/utils/size_utils.dart';
import 'package:priority_soft_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:priority_soft_ecommerce/features/cart/presentation/cubit/fetch_cart_detail.dart';

class HomepageAppBar extends StatefulWidget {
  const HomepageAppBar({super.key, required this.onTap});
  final ValueChanged<ShoesBrand> onTap;
  @override
  State<HomepageAppBar> createState() => _HomepageAppBarState();
}

class _HomepageAppBarState extends State<HomepageAppBar> {
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discover",
              style: AppTextStyle.headline700.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
            IconButton(
                onPressed: () {
                  NavigationService.pushNamed(routeName: Routes.cartScreen);
                },
                icon: BlocSelector<FetchCartDetailCubit, CommonState, bool>(
                  selector: (state) {
                    if (state is CommonSuccessState<List<CartModel>>) {
                      if (state.data.isNotEmpty) {
                        return true;
                      }
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return Stack(
                      children: [
                        CustomIcon.applyStyle(Assets.cart, width: 24),
                        if (state)
                          const Positioned(
                              left: 14,
                              top: 5,
                              child: CircleAvatar(
                                backgroundColor: AppColors.primaryError500,
                                radius: 4,
                              ))
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
      expandedHeight: 100,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Row(
              children: List<Widget>.generate(
                ShoesBrand.values.length,
                (int index) {
                  return ChoiceChip(
                    label:
                        Text(ShoesBrand.values[index].brandName.captialize()),
                    selected: _selectedChipIndex == index,
                    onSelected: (bool selected) {
                      setState(
                        () {
                          _selectedChipIndex = index;
                        },
                      );
                      widget.onTap(ShoesBrand.values[_selectedChipIndex]);
                    },
                  );
                },
              ).toList(),
            ),
          )),
    );
  }
}
