import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'features/home/presentation/pages/home_page/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(Brightness.dark),
      home: const HomePage(),
    );
  }
}
