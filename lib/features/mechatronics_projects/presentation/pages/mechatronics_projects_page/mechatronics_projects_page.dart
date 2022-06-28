import 'package:flutter/material.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/app_page_template/app_page_template.dart';

import 'components/mechatronics_projects_list_widget.dart';

class MechatronicsProjectsPage extends StatelessWidget {
  const MechatronicsProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppPageTemplate(
      currentPageRoute: AppRoutes.mechatronicsProjects,
      body: MechatronicsProjectsListWidget(),
    );
  }
}
