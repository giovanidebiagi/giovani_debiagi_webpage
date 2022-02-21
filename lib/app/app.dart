import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/shared/templates/app_page_template/app_navigation_bloc.dart';
import 'package:giovani_debiagi_webpage/app/shared/templates/app_page_template/app_page_template.dart';
import 'shared/constants/app_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appNavigationBloc = AppNavigationBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getThemeData(context),
      home: AppPageTemplate(
        appNavigationBloc: _appNavigationBloc,
      ),
    );
  }

  @override
  void dispose() {
    _appNavigationBloc.dispose();
    super.dispose();
  }
}
