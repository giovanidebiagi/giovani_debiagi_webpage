import 'package:flutter/material.dart';
import 'components/app_nav_bar/app_nav_bar.dart';
import 'components/drawer_menu/drawer_menu.dart';
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
      drawer: DrawerMenu(currentPageRoute: currentPageRoute),
      backgroundColor: AppColors.pagePrimaryBackgroundColor,
      body: CustomScrollView(
        slivers: [
          AppNavBar(
            currentPageRoute: currentPageRoute,
          ),
          SliverToBoxAdapter(child: body)
        ],
      ),
    );
  }
}
