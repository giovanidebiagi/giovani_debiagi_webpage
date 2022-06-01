import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.ubuntuTextTheme(
      const TextTheme(
        bodyText2: TextStyle(
          color: AppColors.defaultTextColor,
        ),
      ),
    ),
  );
}
