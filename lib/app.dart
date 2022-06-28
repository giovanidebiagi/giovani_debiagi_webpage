import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'features/flutter_projects/presentation/pages/flutter_projects_page/flutter_projects_page.dart';
import 'core/app_theme.dart';
import 'features/home/presentation/pages/home_page/home_page.dart';
import 'features/mechatronics_projects/presentation/pages/mechatronics_projects_page/mechatronics_projects_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giovani Debiagi Portfolio',
      theme: buildTheme(Brightness.dark),
      onGenerateRoute: (settings) {
        Widget? _page;

        switch (settings.name) {
          case AppRoutes.homePage:
            _page = const HomePage();
            break;

          case AppRoutes.flutterProjects:
            _page = const FlutterProjectsPage();
            break;

          case AppRoutes.mechatronicsProjects:
            _page = const MechatronicsProjectsPage();
            break;
        }

        if (_page != null) {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => _page!,
              transitionDuration: Duration.zero);
        }
      },
      home: const HomePage(),
    );
  }
}
