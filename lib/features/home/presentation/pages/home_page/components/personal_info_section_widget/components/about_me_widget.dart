import 'package:flutter/material.dart';
import '../../../../../../../../core/size_constants.dart';
import '../../../../../../data/personal_info_constants.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          'About me',
          style: TextStyle(
              fontSize: SizeConstants.sectionTitleTextSize,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: SizeConstants.sectionSpacingBetweenTitleAndContent),
        Text(PersonalInfoConstants.personalInfoAboutMeDescription),
      ],
    );
  }
}
