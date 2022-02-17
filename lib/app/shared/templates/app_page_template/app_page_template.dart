import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/modules/flutter_projects/flutter_projects_page.dart';
import 'package:giovani_debiagi_webpage/app/modules/home/home_page.dart';
import 'package:giovani_debiagi_webpage/app/modules/mechatronics_projects/mechatronics_projects_page.dart';
import 'package:giovani_debiagi_webpage/app/shared/templates/app_page_template/app_navigation_bloc.dart';
import 'components/app_navigator_bar/app_navigation_bar.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({required this.navigationBloc, Key? key}) : super(key: key);

  final AppNavigationBloc navigationBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavigationBar(
            navigationBloc: navigationBloc,
          ),
          SizedBox(
            height: 500,
            child: Navigator(
              key: navigationBloc.innerNavigatorKey,
              onGenerateRoute: (settings) {
                return PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  pageBuilder: ((context, animation, secondaryAnimation) {
                    late Widget _page;
                    switch (settings.name) {
                      case '/flutter_projects':
                        _page = const FlutterProjectsPage();
                        break;

                      case '/mechatronics_projects':
                        _page = const MechatronicsProjectsPage();
                        break;

                      default:
                        _page = const HomePage();
                        break;
                    }

                    return _page;
                  }),
                  settings: settings,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
