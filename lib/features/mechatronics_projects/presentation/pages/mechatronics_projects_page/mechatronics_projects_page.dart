import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/app_page_template.dart';

import '../../../../../core/app_colors.dart';
import 'components/mechatronics_projects_list_widget.dart';

class MechatronicsProjectsPage extends StatelessWidget {
  const MechatronicsProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: Text(
              'Mechatronics Projects',
              style: TextStyle(fontSize: 24, color: AppColors.primaryColor),
            ),
          ),
          MechatronicsProjectsListWidget(),
        ],
      ),
      currentPageRoute: AppRoutes.mechatronicsProjects,
    );
  }
}
