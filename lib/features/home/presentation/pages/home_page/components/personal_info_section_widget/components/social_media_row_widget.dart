import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/data/assets/images/icons/social_media_icons/social_media_icons_paths.dart';
import '../../../../../../../../../core/data/personal_info_constants.dart';
import '../../../../../../../../../core/widgets/social_media_widget.dart';

class SocialMediaRowWidget extends StatelessWidget {
  const SocialMediaRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 16.0,
      children: [
        SocialMediaWidget(
          imagePath: SocialMediaIconsPaths.iconsPaths['LinkedIn'],
          url: PersonalInfoConstants.personalInfoLinkedInUrl,
        ),
        const SizedBox(width: 32.0),
        SocialMediaWidget(
          imagePath: SocialMediaIconsPaths.iconsPaths['GitHub'],
          url: PersonalInfoConstants.personalInfoGitHubUrl,
        ),
        const SizedBox(width: 32.0),
        SocialMediaWidget(
          imagePath: SocialMediaIconsPaths.iconsPaths['YouTube'],
          url: PersonalInfoConstants.personalYouTubeUrl,
        ),
      ],
    );
  }
}
