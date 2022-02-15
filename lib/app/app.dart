import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/modules/home/home_page.dart';
import 'package:giovani_debiagi_webpage/app/routes/app_pages.dart';
import 'shared/constants/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getThemeData(context),
      routes: AppPages.getAppPages(),
      home: const HomePage(),
    );
  }
}
