import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/data/giovani_debiagi_webpage_project_constants.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/components/app_nav_bar_bottom_widget/app_nav_bar_bottom_widget.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/components/app_nav_bar_page_button.dart';
import '../../../../app_colors.dart';
import '../../../../size_constants.dart';

class AppNavBar extends StatefulWidget {
  final String currentPageRoute;

  const AppNavBar({Key? key, required this.currentPageRoute}) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return SliverAppBar(
      key: widget.key,
      backgroundColor: AppColors.pageSecondaryBackgroundColor,
      title: _screenWidth < SizeConstants.tabletMaxWidth
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppNavBarPageButton(
                      title: 'About me',
                      pageRoute: AppRoutes.homePage,
                      currentPageRoute: widget.currentPageRoute),
                  const SizedBox(width: 48),
                  AppNavBarPageButton(
                      title: 'Flutter Projects',
                      pageRoute: AppRoutes.flutterProjects,
                      currentPageRoute: widget.currentPageRoute),
                  const SizedBox(width: 48),
                  AppNavBarPageButton(
                      title: 'Mechatronics Projects',
                      pageRoute: AppRoutes.mechatronicsProjects,
                      currentPageRoute: widget.currentPageRoute),
                  const SizedBox(width: 48),
                ],
              ),
            ),
      bottom: _screenWidth < SizeConstants.tabletMaxWidth
          ? null
          : PreferredSize(
              preferredSize: Size(_screenWidth, 30),
              child: const AppNavBarBottomWidget(),
            ),
    );
  }
}
