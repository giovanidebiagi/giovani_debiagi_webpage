import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/features/home/data/personal_info_constants.dart';

import 'profession_widget.dart';

class ProfessionsWidget extends StatelessWidget {
  const ProfessionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
