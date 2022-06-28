import 'package:flutter/material.dart';
import '../../../../../../core/app_colors.dart';
import '../../../../../../core/size_constants.dart';
import '../../../../../../core/text_styles.dart';
import '../../../../domain/entities/flutter_project.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FlutterProjectsPageFlutterProjectWidget extends StatelessWidget {
  const FlutterProjectsPageFlutterProjectWidget(
      {Key? key, required this.flutterProject, required this.color})
      : super(key: key);

  final FlutterProject flutterProject;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 4 *
                            SizeConstants.flutterProjectsScreenshotsWidth +
                        3 *
                            SizeConstants
                                .flutterProjectsHorizontalSpacingBetweenScreenshots +
                        48.0,
                  ),
                  child: Wrap(
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
                ),
              ),
              const SizedBox(width: 24.0),
              Flexible(
                flex: 1,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 300),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Text(
                            flutterProject.name,
                            style: TextStyles.sectionTitleTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: SizeConstants
                              .spacingBetweenProjectTitleAndDescription),
                      Text(
                        flutterProject.description,
                        textAlign: TextAlign.justify,
                      ),
                      flutterProject.gitHubUrl != ''
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: SizeConstants
                                      .spacingBetweenProjectDescriptionAndBottomButton,
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.primaryColor),
                                    ),
                                    onPressed: () async {
                                      await launchUrlString(
                                          flutterProject.gitHubUrl);
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.0),
                                      child: Text('Avaliable on GitHub'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Column(
    //   children: [
    //     Container(
    //       color: color,
    //       child: Padding(
    //         padding:
    //             const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48.0),
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               width: 4 * SizeConstants.flutterProjectsScreenshotsWidth +
    //                   3 *
    //                       SizeConstants
    //                           .flutterProjectsHorizontalSpacingBetweenScreenshots,
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         flutterProject.name,
    //                         style: TextStyles.sectionTitleTextStyle,
    //                       ),
    //                       flutterProject.gitHubUrl != ''
    //                           ? Row(
    //                               children: [
    //                                 const SizedBox(width: 24.0),
    //                                 MouseRegion(
    //                                   cursor: SystemMouseCursors.click,
    //                                   child: ElevatedButton(
    //                                     style: ButtonStyle(
    //                                       backgroundColor:
    //                                           MaterialStateProperty.all(
    //                                               Colors.black),
    //                                     ),
    //                                     onPressed: () async {
    //                                       await launchUrlString(
    //                                           flutterProject.gitHubUrl);
    //                                     },
    //                                     child:
    //                                         const Text('Avaliable on GitHub'),
    //                                   ),
    //                                 ),
    //                               ],
    //                             )
    //                           : const SizedBox.shrink()
    //                     ],
    //                   ),
    //                   const SizedBox(
    //                       height: SizeConstants
    //                           .spacingBetweenProjectTitleAndDescription),
    //                   Text(
    //                     flutterProject.description,
    //                     textAlign: TextAlign.center,
    //                   ),
    //                   const SizedBox(height: 36.0),
    //                   Wrap(
    //                     direction: Axis.horizontal,
    //                     runSpacing: SizeConstants
    //                         .flutterProjectsVerticalSpacingBetweenScreenshots,
    //                     spacing: SizeConstants
    //                         .flutterProjectsHorizontalSpacingBetweenScreenshots,
    //                     children: flutterProject.projectImagesPaths
    //                         .map(
    //                           (projectImagePath) => Image.asset(
    //                             projectImagePath,
    //                             width: SizeConstants
    //                                 .flutterProjectsScreenshotsWidth,
    //                             filterQuality: FilterQuality.medium,
    //                           ),
    //                         )
    //                         .toList(),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
