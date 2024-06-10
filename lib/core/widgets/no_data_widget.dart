// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';

class NoDataWidget extends StatelessWidget {
  final String? message;
  const NoDataWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.error),
          const SizedBox(height: 24),
          Text(
            message ?? "No Data Found",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
