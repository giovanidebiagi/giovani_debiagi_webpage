import 'package:flutter/material.dart';
import '../../../../../../../core/size_constants.dart';
import '../../../../../../../core/text_styles.dart';
import '../../../../../../../core/app_colors.dart';
import '../../home_page_widget_templates/home_page_section_widget.dart';
import 'components/skills_list_widget/skills_list_widget.dart';

class SkillsSectionWidget extends StatelessWidget {
  const SkillsSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageSectionTemplate(
      color: AppColors.pageSecondaryBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'Skills',
            style: TextStyles.sectionTitleTextStyle,
          ),
          SizedBox(height: SizeConstants.sectionSpacingBetweenTitleAndContent),
          SkillsListWidget(),
        ],
      ),
    );
  }
}
