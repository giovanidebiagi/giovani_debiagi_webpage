import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/data/personal_info_constants.dart';

import 'profession_widget.dart';

class ProfessionsWidget extends StatelessWidget {
  const ProfessionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12.0,
      children: const [
        ProfessionWidget(
          PersonalInfoConstants.mechatronicsImagePath,
          '''Mechatronics
Engineer''',
        ),
        SizedBox(width: 24.0),
        ProfessionWidget(
          PersonalInfoConstants.flutterImagePath,
          '''Flutter
Developer''',
        ),
      ],
    );
  }
}
