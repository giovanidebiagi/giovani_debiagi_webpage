import 'package:flutter/material.dart';

class AppTheme {
  static const Color defaultTextColor = Colors.white;
  static const Color defaultScaffoldBackgroundPrimaryColor = Color.fromRGBO(31, 34, 53, 1);
  static const Color defaultScaffoldBackgroundSecondaryColor = Color.fromRGBO(40, 43, 65, 1);

  static ThemeData getThemeData(BuildContext context) {
    Color _defaultTextColorLocal = defaultTextColor;

    ThemeData _themeData = ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: _defaultTextColorLocal,
            bodyColor: _defaultTextColorLocal,
          ),
      scaffoldBackgroundColor: defaultScaffoldBackgroundPrimaryColor,
    );

    return _themeData;
  }
}
