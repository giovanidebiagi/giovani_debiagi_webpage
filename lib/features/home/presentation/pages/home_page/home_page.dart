import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/data/giovani_debiagi_webpage_project_constants.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/size_constants.dart';
import '../../../../../core/widgets/social_media_widget.dart';
import 'components/projects_section_widget/projects_section_widget.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/data/assets/images/icons/social_media_icons/social_media_icons_paths.dart';
import '../../../../../core/widgets/app_page_template/app_page_template.dart';
import 'components/personal_info_section_widget/personal_info_section_widget.dart';
import 'components/skills_section_widget/skills_section_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;

    return AppPageTemplate(
      currentPageRoute: AppRoutes.homePage,
      body: Column(children: [
        _screenWidth < SizeConstants.tabletMaxWidth
            ? Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                color: AppColors.pagePrimaryBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          GiovaniDebiagiWebpageProjectConstants
                              .bottomNavBarText,
                          textStyle:
                              const TextStyle(color: AppColors.primaryColor),
                        )
                      ],
                      pause: const Duration(seconds: 4),
                      repeatForever: true,
                    ),
                    const SizedBox(height: 8.0),
                    SocialMediaWidget(
                      imagePath: SocialMediaIconsPaths.iconsPaths['GitHub'],
                      url: GiovaniDebiagiWebpageProjectConstants
                          .projectGitHubUrl,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const PersonalInfoSectionWidget(),
        const SkillsSectionWidget(),
        const ProjectsSectionWidget(),
      ]),
    );
  }
}
