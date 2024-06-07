import 'package:flutter/material.dart';
import 'package:priority_soft_ecommerce/features/homepage/presentation/widgets/homepage_app_bar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
      slivers: [
        HomepageAppBar(),
      ],
    ));
  }
}
