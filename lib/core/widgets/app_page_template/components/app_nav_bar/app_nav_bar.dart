import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/components/app_nav_bar_page_button.dart';

import '../../../../app_colors.dart';

class AppNavBar extends SliverAppBar {
  final String currentPageRoute;
  final bool compressed;

  AppNavBar({Key? key, required this.currentPageRoute, this.compressed = false})
      : super(
          // automaticallyImplyLeading: compressed ? true : false,
          key: key,
          backgroundColor: AppColors.pageSecondaryBackgroundColor,
          title: compressed
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppNavBarPageButton(
                          title: 'About me',
                          pageRoute: AppRoutes.homePage,
                          currentPageRoute: currentPageRoute),
                      const SizedBox(width: 48),
                      AppNavBarPageButton(
                          title: 'Flutter Projects',
                          pageRoute: AppRoutes.flutterProjects,
                          currentPageRoute: currentPageRoute),
                      const SizedBox(width: 48),
                      AppNavBarPageButton(
                          title: 'Mechatronics Projects',
                          pageRoute: AppRoutes.mechatronicsProjects,
                          currentPageRoute: currentPageRoute),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
        );
}
