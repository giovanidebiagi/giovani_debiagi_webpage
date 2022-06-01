import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/features/home/data/personal_info_constants.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          'About me',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24.0),
        Text(PersonalInfoConstants.personalInfoAboutMeDescription),
      ],
    );
  }
}
