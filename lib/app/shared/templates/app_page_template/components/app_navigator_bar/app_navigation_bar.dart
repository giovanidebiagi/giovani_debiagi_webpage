import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/routes/app_routes.dart';
import '../../../../constants/app_theme.dart';
import 'app_navigation_bar_page_button.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 300,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 70,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppRoutes.appRoutesHashMap.length,
              itemBuilder: (context, index) {
                return AppNavigationBarPageButton(
                  title: AppRoutes.appRoutesHashMap.keys.elementAt(index),
                );
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: AppTheme.defaultScaffoldBackgroundSecondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
