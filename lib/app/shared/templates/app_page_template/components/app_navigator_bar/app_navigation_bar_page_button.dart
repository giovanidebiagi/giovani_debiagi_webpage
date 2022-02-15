import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/routes/app_routes.dart';

class AppNavigationBarPageButton extends StatelessWidget {
  const AppNavigationBarPageButton({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO:  Check if it's not the current route
        Navigator.pushNamed(context, AppRoutes.appRoutesHashMap[title]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
