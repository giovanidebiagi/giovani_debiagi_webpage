import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/shared/templates/app_page_template/app_navigation_bloc.dart';
import 'package:giovani_debiagi_webpage/app/shared/templates/app_page_template/app_page_template.dart';
import 'shared/constants/app_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _navigationBloc = AppNavigationBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getThemeData(context),
      home: AppPageTemplate(
        navigationBloc: _navigationBloc,
      ),
    );
  }
}
