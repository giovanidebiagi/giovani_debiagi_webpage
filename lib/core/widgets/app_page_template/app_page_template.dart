import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/app_nav_bar.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/drawer_menu/drawer_menu.dart';
import '../../app_colors.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({Key? key, required this.body, required this.currentPageRoute})
      : super(key: key);

  final Widget body;
  final String currentPageRoute;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool _compressed = constraints.minWidth < 700 ? true : false;

      return Scaffold(
        drawer: DrawerMenu(currentPageRoute: currentPageRoute),
        backgroundColor: AppColors.pagePrimaryBackgroundColor,
        body: CustomScrollView(
          slivers: [
            AppNavBar(
              currentPageRoute: currentPageRoute,
              compressed: _compressed,
            ),
            SliverToBoxAdapter(
              child: body,
            )
          ],
        ),
      );
    });
  }
}
