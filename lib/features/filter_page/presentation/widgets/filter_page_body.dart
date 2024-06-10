import 'package:flutter/material.dart';

import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/enums/shoes_brand_enum.dart';
import 'package:priority_soft_ecommerce/core/extension/string_extension.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/features/filter_page/presentation/widgets/filter_widgets.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPageBody extends StatefulWidget {
  const FilterPageBody({super.key, required this.shoes});
  final List<Shoes> shoes;

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

  int _selectedChipIndex = 0;

  double start = 100.0;
  double end = 500.0;

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
          children: [
            FilterWidgets(
                title: "Brands",
                widget: Row(
                  children: List.generate(
                    ShoesBrand.values.length,
                    (index) => Column(
                      children: [
                        ChoiceChip(
                            selected: _selectedChipIndex == index,
                            onSelected: (bool selected) {
                              setState(
                                () {
                                  _selectedChipIndex = index;
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
                                _selectedChipIndex == index
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
                        width: MediaQuery.of(context).size.width * 0.90,
                        child:
                            // RangeSlider(
                            //   activeColor: AppColors.primaryDark,
                            //   inactiveColor: AppColors.primarylight200,
                            //   labels: RangeLabels(start.toString(), end.toString()),
                            //   values: RangeValues(start, end),
                            //   onChanged: (value) {
                            //     setState(() {});
                            //     start = value.start;
                            //     end = value.end;
                            //   },
                            //   max: 700,
                            //   min: 0,
                            // ),
                            SfRangeSlider(
                          showLabels: true,
                          values: SfRangeValues(start, end),
                          onChanged: (value) {
                            setState(() {});
                            start = value.start;
                            end = value.end;
                          },
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
