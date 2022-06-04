import 'package:flutter/material.dart';

import '../../../../../../../data/personal_info_constants.dart';
import 'social_media_widget.dart';

class SocialMediaRowWidget extends StatelessWidget {
  const SocialMediaRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialMediaWidget(
          imagePath:
              'lib/features/home/data/assets/images/social_media_icons/linkedin_icon.png',
          url: PersonalInfoConstants.personalInfoLinkedInUrl,
        ),
        SizedBox(width: 32.0),
        SocialMediaWidget(
          imagePath:
              'lib/features/home/data/assets/images/social_media_icons/github_icon.png',
          url: PersonalInfoConstants.personalInfoGitHubUrl,
        ),
        SizedBox(width: 32.0),
        SocialMediaWidget(
          imagePath:
              'lib/features/home/data/assets/images/social_media_icons/youtube_icon.png',
          url: PersonalInfoConstants.personalYouTubeUrl,
        ),
      ],
    );
  }
}
