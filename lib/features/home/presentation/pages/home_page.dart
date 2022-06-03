import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/app_page_template.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/components/personal_info_widget/personal_info_widget.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/components/skills_widget/components/skills_list_widget/skills_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      body: Column(children: const [
        PersonalInfoWidget(),
        SkillsListWidget(),
      ]),
    );
  }
}
