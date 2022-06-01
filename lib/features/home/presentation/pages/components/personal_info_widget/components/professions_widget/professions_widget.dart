import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/components/personal_info_widget/components/professions_widget/profession_widget.dart';

class ProfessionsWidget extends StatelessWidget {
  const ProfessionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ProfessionWidget(
          'lib/features/home/data/assets/images/profession_images/mechatronics_engineer.png',
          '''Mechatronics
Engineer''',
        ),
        SizedBox(width: 24.0),
        ProfessionWidget(
          'lib/features/home/data/assets/images/profession_images/flutter_developer.png',
          '''Flutter
Developer''',
        ),
      ],
    );
  }
}
