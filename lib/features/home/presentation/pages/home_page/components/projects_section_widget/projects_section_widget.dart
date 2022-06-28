import 'package:flutter/material.dart';
import '../../../../../../../core/app_colors.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/size_constants.dart';
import '../../../../../../../core/text_styles.dart';
import 'components/projects_section_project_widget.dart';
import '../../home_page_widget_templates/home_page_section_widget.dart';
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
