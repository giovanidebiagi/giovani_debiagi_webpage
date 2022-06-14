import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import 'package:giovani_debiagi_webpage/core/text_styles.dart';
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
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConstants.sectionSpacingBetweenTitleAndContent),
            child: Text(
              'Flutter Projects',
              style: TextStyles.sectionTitleTextStyle,
            ),
          ),
          FlutterProjectsListWidget(),
        ],
      ),
    );
  }
}
