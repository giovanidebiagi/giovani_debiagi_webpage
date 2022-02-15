import 'package:flutter/material.dart';
import 'app_page_template/components/app_navigator_bar/app_navigation_bar.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({required this.body, Key? key}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppNavigationBar(),
          body,
        ],
      ),
    );
  }
}
