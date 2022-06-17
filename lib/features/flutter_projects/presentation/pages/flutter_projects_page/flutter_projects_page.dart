import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/app_colors.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/app_page_template.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/pages/flutter_projects_page/components/flutter_projects_list_widget.dart';

class FlutterProjectsPage extends StatefulWidget {
  const FlutterProjectsPage({Key? key}) : super(key: key);

  @override
  State<FlutterProjectsPage> createState() => _FlutterProjectsPageState();
}

class _FlutterProjectsPageState extends State<FlutterProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      currentPageRoute: AppRoutes.flutterProjects,
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: Text(
              'Flutter Projects',
              style: TextStyle(fontSize: 24, color: AppColors.primaryColor),
            ),
          ),
          FlutterProjectsListWidget(),
        ],
      ),
    );
  }
}
