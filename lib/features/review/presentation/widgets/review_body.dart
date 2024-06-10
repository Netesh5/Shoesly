import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/core/constants/assets.dart';
import 'package:priority_soft_ecommerce/core/constants/assets_style.dart';
import 'package:priority_soft_ecommerce/core/enums/rating_enum.dart';
import 'package:priority_soft_ecommerce/core/themes/app_colors.dart';
import 'package:priority_soft_ecommerce/core/themes/app_text.dart';
import 'package:priority_soft_ecommerce/core/utils/calculate_rating.dart';
import 'package:priority_soft_ecommerce/core/utils/size_utils.dart';
import 'package:priority_soft_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:priority_soft_ecommerce/core/widgets/no_data_widget.dart';
import 'package:priority_soft_ecommerce/features/homepage/domain/entities/shoes_enity.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/review_widget.dart';

class ReviewBody extends StatefulWidget {
  const ReviewBody({
    super.key,
    required this.shoes,
  });

  final Shoes shoes;

  @override
  State<ReviewBody> createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  int _selectedChipIndex = 0;
  Rating currentRating = Rating.All;
  List<Review> filterData = [];
  filterItems(List<Review> review) {
    if (currentRating == Rating.All) {
      return review;
    }
    return review
        .where((element) => element.rating == currentRating.rate)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    filterData = filterItems(widget.shoes.review);
    return Scaffold(
      appBar: CustomAppBar(
        showShadow: false,
        centerMiddle: true,
        title: "Review",
        actions: [
          CustomIcon.applyStyle(Assets.star,
              width: 20, color: AppColors.primaryWarning500),
          const SizedBox(
            width: 10,
          ),
          Text(
            calculateAverageRating(widget.shoes.review).toString(),
            style: AppTextStyle.heading300,
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    Rating.values.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(Rating.values[index].rating),
                        selected: _selectedChipIndex == index,
                        onSelected: (bool selected) {
                          setState(
                            () {
                              _selectedChipIndex = index;
                              currentRating = Rating.values[_selectedChipIndex];
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            )),
      ),
      body: filterData.isEmpty
          ? const NoDataWidget()
          : ListView.builder(
              itemBuilder: (context, index) {
                if (filterData.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ReviewWidget(
                      review: filterData[index],
                      rating: filterData[index].rating.toDouble(),
                    ),
                  );
                }
                return const NoDataWidget();
              },
              itemCount: filterData.length,
            ),
    );
  }
}
