import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class ColorIndicatorWidget extends StatelessWidget {
  ColorIndicatorWidget({
    super.key,
  });

  final List colors = [
    AppColors.primarylight,
    AppColors.primaryDark,
    AppColors.brandGreen900,
    AppColors.primaryInformation500,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 130,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primarylight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  4,
                  (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 11,
                            backgroundColor: AppColors.primaryDark,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: colors[index],
                              child: index == 1
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.primarylight,
                                      size: 10,
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          )
                        ],
                      ))
            ],
          ),
        )
      ],
    );
  }
}
