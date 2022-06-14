import 'package:flutter/material.dart';

import '../../../../../../../../../core/data/personal_info_constants.dart';
import 'social_media_widget.dart';

class SocialMediaRowWidget extends StatelessWidget {
  const SocialMediaRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaWidget(
          imagePath: PersonalInfoConstants.socialMedia['LinkedIn'],
          url: PersonalInfoConstants.personalInfoLinkedInUrl,
        ),
        const SizedBox(width: 32.0),
        SocialMediaWidget(
          imagePath: PersonalInfoConstants.socialMedia['GitHub'],
          url: PersonalInfoConstants.personalInfoGitHubUrl,
        ),
        const SizedBox(width: 32.0),
        SocialMediaWidget(
          imagePath: PersonalInfoConstants.socialMedia['YouTube'],
          url: PersonalInfoConstants.personalYouTubeUrl,
        ),
      ],
    );
  }
}
