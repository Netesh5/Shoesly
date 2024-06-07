// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';

class HomepageAppBar extends StatefulWidget {
  const HomepageAppBar({
    super.key,
  });

  @override
  State<HomepageAppBar> createState() => _HomepageAppBarState();
}

class _HomepageAppBarState extends State<HomepageAppBar> {
  int _selectedChipIndex = 0;

  final List<String> _categories = [
    'All',
    'Nike',
    'Jordan',
    'Adidas',
    'Reebok'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      flexibleSpace: FlexibleSpaceBar(
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
              onPressed: () {},
              icon: AssetStyle.applyStyle(Assets.cart, width: 24),
            )
          ],
        ),
      ),
      expandedHeight: 100,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Wrap(
            spacing: 8.0,
            children: List<Widget>.generate(
              _categories.length,
              (int index) {
                return ChoiceChip(
                  label: Text(_categories[index]),
                  selected: _selectedChipIndex == index,
                  onSelected: (bool selected) {
                    setState(
                      () {
                        _selectedChipIndex = selected ? index : 0;
                      },
                    );
                  },
                );
              },
            ).toList(),
          )),
    );
  }
}
