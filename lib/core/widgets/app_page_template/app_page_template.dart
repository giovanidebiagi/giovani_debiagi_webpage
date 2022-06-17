import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/app_nav_bar.dart';

import '../../app_colors.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate(
      {Key? key, required this.body, required this.currentPageRoute})
      : super(key: key);

  final Widget body;
  final String currentPageRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagePrimaryBackgroundColor,
      body: CustomScrollView(
        slivers: [
          AppNavBar(currentPageRoute: currentPageRoute),
          SliverToBoxAdapter(
            child: body,
          )
        ],
      ),
    );
  }
}
