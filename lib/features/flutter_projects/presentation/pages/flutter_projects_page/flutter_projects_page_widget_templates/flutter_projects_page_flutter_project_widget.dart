import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import 'package:giovani_debiagi_webpage/core/text_styles.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FlutterProjectsPageFlutterProjectWidget extends StatelessWidget {
  const FlutterProjectsPageFlutterProjectWidget(
      {Key? key, required this.flutterProject, required this.color})
      : super(key: key);

  final FlutterProject flutterProject;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0),
        child: Column(
          children: [
            SizedBox(
              width: 4 * SizeConstants.flutterProjectsScreenshotsWidth +
                  3 *
                      SizeConstants
                          .flutterProjectsHorizontalSpacingBetweenScreenshots,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        flutterProject.name,
                        style: TextStyles.sectionTitleTextStyle,
                      ),
                      flutterProject.gitHubUrl != ''
                          ? Row(
                              children: [
                                const SizedBox(width: 24.0),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                    ),
                                    onPressed: () async {
                                      await launchUrlString(
                                          flutterProject.gitHubUrl);
                                    },
                                    child: const Text('Avaliable on GitHub'),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                  const SizedBox(
                      height: SizeConstants
                          .spacingBetweenProjectTitleAndDescription),
                  Text(
                    flutterProject.description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 36.0),
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: SizeConstants
                        .flutterProjectsVerticalSpacingBetweenScreenshots,
                    spacing: SizeConstants
                        .flutterProjectsHorizontalSpacingBetweenScreenshots,
                    children: flutterProject.projectImagesPaths
                        .map(
                          (projectImagePath) => Image.asset(
                            projectImagePath,
                            width:
                                SizeConstants.flutterProjectsScreenshotsWidth,
                            filterQuality: FilterQuality.medium,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
