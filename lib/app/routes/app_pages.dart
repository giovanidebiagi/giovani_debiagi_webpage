import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/modules/home/home_page.dart';
import 'package:giovani_debiagi_webpage/app/routes/app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> getAppPages() {
    Map<String, Widget Function(BuildContext)> _appPages = {
      AppRoutes.appRoutesHashMap['Home']: (context) => const HomePage(),
    };

    return _appPages;
  }
}
