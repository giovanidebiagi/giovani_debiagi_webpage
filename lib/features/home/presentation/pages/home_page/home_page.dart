import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/home_page/components/projects_section_widget/projects_section_widget.dart';

import '../../../../../core/widgets/app_page_template/app_page_template.dart';
import 'components/personal_info_section_widget/personal_info_section_widget.dart';
import 'components/skills_section_widget/skills_section_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      body: Column(children: const [
        PersonalInfoSectionWidget(),
        SkillsSectionWidget(),
        ProjectsSectionWidget(),
      ]),
    );
  }
}
