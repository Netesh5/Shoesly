import 'package:flutter/material.dart';

import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/enums/colors_enum.dart';
import 'package:priority_soft_ecommerce/core/enums/gender_enum.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
import 'package:priority_soft_ecommerce/core/enums/sort_by_enum.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';

import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_choice_chip.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_navigation_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_round_button.dart';
import 'package:priority_soft_ecommerce/features/filter_page/presentation/widgets/filter_widgets.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPageBody extends StatefulWidget {
  const FilterPageBody(
      {super.key, required this.shoes, required this.onChanged});
  final List<Shoes> shoes;
  final ValueChanged<List<Shoes>> onChanged;

  @override
  State<FilterPageBody> createState() => _FilterPageBodyState();
}

class _FilterPageBodyState extends State<FilterPageBody> {
  getTotalShoesCount(int index) {
    if (index == 0) {
      return widget.shoes.length;
    }
    return widget.shoes
        .where((element) => element.brand == ShoesBrand.values[index].brandName)
        .length;
  }

  int _selectedBrandIndex = 0;
  int _selectedSortByIndex = 0;
  int _selctedGenderIndex = 0;
  int _selectedShoesColorIndex = 0;

  double start = 100.0;
  double end = 500.0;

  int selectedSortBy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showShadow: false,
        title: "Filter",
        centerMiddle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FilterWidgets(
                title: "Brands",
                widget: Row(
                  children: List.generate(
                    ShoesBrand.values.length,
                    (index) => Column(
                      children: [
                        ChoiceChip(
                            selected: _selectedBrandIndex == index,
                            onSelected: (bool selected) {
                              setState(
                                () {
                                  _selectedBrandIndex = index;
                                },
                              );
                            },
                            label: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.primarylight100,
                                  radius: 25,
                                  child: index == 0
                                      ? Text(
                                          ShoesBrand.values[index].brandName
                                              .captialize(),
                                          style: AppTextStyle.headline400
                                              .copyWith(
                                                  color: AppColors.primaryDark),
                                        )
                                      : CustomIcon.applyStyle(
                                          ShoesBrand.values[index].logo),
                                ),
                                _selectedBrandIndex == index
                                    ? const Positioned(
                                        top: 25,
                                        left: 30,
                                        child: Icon(
                                          Icons.check_circle_sharp,
                                          size: 20,
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ShoesBrand.values[index].brandName.captialize(),
                          style: AppTextStyle.heading300,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getTotalShoesCount(index).toString(),
                          style: AppTextStyle.bodytext10
                              .copyWith(color: AppColors.primarylight400),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            FilterWidgets(
                title: "Price Range",
                widget: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: SfRangeSlider(
                        max: 700,
                        min: 0,
                        activeColor: AppColors.primaryDark,
                        inactiveColor: AppColors.primarylight200,
                        enableTooltip: true,
                        showLabels: true,
                        values: SfRangeValues(start, end),
                        onChanged: (value) {
                          setState(() {});
                          start = value.start;
                          end = value.end;
                        },
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            FilterWidgets(
              title: "Sort By",
              widget: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    SortBy.values.length,
                    (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomChoiceChip(
                          selectedIndex: _selectedSortByIndex,
                          index: index,
                          label: SortBy.values[index].sortBy,
                          valueChange: (value) {
                            setState(() {
                              _selectedSortByIndex = value;
                            });
                          },
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilterWidgets(
              title: "Gender",
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  Gender.values.length,
                  (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomChoiceChip(
                        selectedIndex: _selctedGenderIndex,
                        index: index,
                        label: Gender.values[index].gender.captialize(),
                        valueChange: (value) {
                          setState(() {
                            _selctedGenderIndex = value;
                          });
                        },
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilterWidgets(
              title: "Colors",
              widget: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    ShoesColor.values.length,
                    (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomChoiceChip(
                          selectedIndex: _selectedShoesColorIndex,
                          suffix: CircleAvatar(
                            radius: 11,
                            backgroundColor:
                                index == 1 ? AppColors.primaryDark : null,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: ShoesColor.values[index].color,
                              child: index == 1
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.primarylight,
                                      size: 10,
                                    )
                                  : null,
                            ),
                          ),
                          backgroundColor: AppColors.primarylight,
                          index: index,
                          label:
                              ShoesColor.values[index].colorName.captialize(),
                          valueChange: (value) {
                            setState(() {
                              _selectedShoesColorIndex = value;
                            });
                          },
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BottomNavigationBarWithButton(
            onChanged: () {
              final filterData = widget.shoes
                  .where((element) =>
                      element.brand ==
                              ShoesBrand
                                  .values[_selectedBrandIndex].brandName &&
                          num.parse(element.rate) >= start ||
                      num.parse(element.rate) <= end &&
                          element.gender ==
                              Gender.values[_selctedGenderIndex].gender &&
                          element.color ==
                              ShoesColor
                                  .values[_selectedShoesColorIndex].colorName)
                  .toList();
              widget.onChanged(filterData);
              setState(() {});
              Navigator.of(context).pop();
            },
            title: "Apply",
            textStyle:
                AppTextStyle.heading300.copyWith(color: AppColors.primarylight),
            prefix: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: CustomRoundedButtom(
                title: "Reset (4)",
                textStyle: AppTextStyle.heading300,
                onPressed: () {
                  _selectedBrandIndex = 0;
                  _selectedSortByIndex = 0;
                  _selctedGenderIndex = 0;
                  _selctedGenderIndex = 0;
                  setState(() {});
                },
              ),
            )),
      ),
    );
  }
}
