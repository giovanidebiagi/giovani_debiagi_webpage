import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/app/shared/constants/app_theme.dart';

import '../../../../../app_navigation_bloc.dart';

class AppNavigationBarNavigationButton extends StatelessWidget {
  const AppNavigationBarNavigationButton(
      {required this.isCurrentRoute, required this.navigationBloc, required this.title, Key? key})
      : super(key: key);

  final String title;
  final bool isCurrentRoute;

  final AppNavigationBloc navigationBloc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        navigationBloc.setCurrentInnerRoute(AppRoutes.appRoutesHashMap[title]);

        if (isCurrentRoute) {
          navigationBloc.innerNavigatorKey.currentState!
              .pushReplacementNamed(AppRoutes.appRoutesHashMap[title]);
        } else {
          navigationBloc.innerNavigatorKey.currentState!
              .pushNamed(AppRoutes.appRoutesHashMap[title]);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isCurrentRoute ? FontWeight.bold : FontWeight.normal,
              color: AppTheme.defaultTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
