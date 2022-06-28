import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/app_colors.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import 'package:giovani_debiagi_webpage/core/text_styles.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/home_page/components/projects_section_widget/components/projects_section_project_widget.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/home_page/home_page_widget_templates/home_page_section_widget.dart';
import '../../../../../../../core/data/personal_info_constants.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageSectionWidget(
      color: AppColors.pageSecondaryBackgroundColor,
      child: Column(
        children: [
          const Text('Projects', style: TextStyles.sectionTitleTextStyle),
          const SizedBox(
            height: SizeConstants.spacingBetweenProjectTitleAndDescription,
          ),
          Row(
            children: const [
              Expanded(
                child: ProjectsSectionProjectWidget(
                  name: 'Flutter',
                  imagePath: PersonalInfoConstants.flutterProjectsImagePath,
                  pageRoute: AppRoutes.flutterProjects,
                ),
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: ProjectsSectionProjectWidget(
                  name: 'Mechatronics',
                  imagePath:
                      PersonalInfoConstants.mechatronicsProjectsImagePath,
                  pageRoute: AppRoutes.mechatronicsProjects,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
