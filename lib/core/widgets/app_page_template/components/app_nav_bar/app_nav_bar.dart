import 'package:flutter/material.dart';
import '../../../../routes/app_routes.dart';
import 'components/app_nav_bar_bottom_widget/app_nav_bar_bottom_widget.dart';
import 'components/app_nav_bar_page_button.dart';
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
      backgroundColor: _screenWidth < SizeConstants.tabletMaxWidth
          ? AppColors.pageSecondaryBackgroundColor
          : AppColors.pagePrimaryBackgroundColor,
      title: _screenWidth < SizeConstants.tabletMaxWidth
          ? Text(
              widget.currentPageRoute == AppRoutes.homePage
                  ? 'Home'
                  : widget.currentPageRoute == AppRoutes.flutterProjects
                      ? 'Flutter Projects'
                      : widget.currentPageRoute ==
                              AppRoutes.mechatronicsProjects
                          ? 'Mechatronics Projects'
                          : '',
              style: const TextStyle(fontSize: 16),
            )
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
