import 'package:flutter/material.dart';
import '../../../../../../../../../core/data/personal_info_constants.dart';

import 'profession_widget.dart';

class ProfessionsWidget extends StatelessWidget {
  const ProfessionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12.0,
      children: const [
        ProfessionWidget(
          PersonalInfoConstants.mechatronicsEngineerImagePath,
          '''Mechatronics
Engineer''',
        ),
        SizedBox(width: 24.0),
        ProfessionWidget(
          PersonalInfoConstants.flutterDeveloperImagePath,
          '''Flutter
Developer''',
        ),
      ],
    );
  }
}
