import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/giovani_debiagi_webpage_project_constants.dart';
import '../../../../../social_media_widget.dart';
import '../../../../../../app_colors.dart';
import '../../../../../../data/assets/images/icons/social_media_icons/social_media_icons_paths.dart';

class AppNavBarBottomWidget extends StatelessWidget {
  const AppNavBarBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pageSecondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 96.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  GiovaniDebiagiWebpageProjectConstants.bottomNavBarText,
                  textStyle: const TextStyle(color: AppColors.primaryColor),
                )
              ],
              pause: const Duration(seconds: 4),
              repeatForever: true,
            ),
            const SizedBox(width: 8.0),
            SocialMediaWidget(
              imagePath: SocialMediaIconsPaths.iconsPaths['GitHub'],
              url: GiovaniDebiagiWebpageProjectConstants.projectGitHubUrl,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
