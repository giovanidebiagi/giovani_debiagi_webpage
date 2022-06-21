import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/app_colors.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/drawer_menu/components/drawer_menu_button.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key, required this.currentPageRoute}) : super(key: key);

  final String currentPageRoute;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.pageSecondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            DrawerMenuButton(
                title: 'About me',
                pageRoute: AppRoutes.homePage,
                currentPageRoute: currentPageRoute),
            DrawerMenuButton(
                title: 'Flutter Projects',
                pageRoute: AppRoutes.flutterProjects,
                currentPageRoute: currentPageRoute),
            DrawerMenuButton(
                title: 'Mechatronics Projects',
                pageRoute: AppRoutes.mechatronicsProjects,
                currentPageRoute: currentPageRoute)
          ],
        ),
      ),
    );
  }
}
