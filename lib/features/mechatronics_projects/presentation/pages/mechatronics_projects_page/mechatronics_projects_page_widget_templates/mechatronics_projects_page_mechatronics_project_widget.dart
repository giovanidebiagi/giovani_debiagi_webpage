import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/size_constants.dart';
import '../../../../../../core/text_styles.dart';
import '../../../../domain/entities/mechatronics_project.dart';

class MechatronicsProjectsPageMechatronicsProjectWidget
    extends StatelessWidget {
  const MechatronicsProjectsPageMechatronicsProjectWidget(
      {Key? key, required this.mechatronicsProject, required this.color})
      : super(key: key);

  final MechatronicsProject mechatronicsProject;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 48.0,
          bottom: 56.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          children: [
            Text(
              mechatronicsProject.name,
              style: TextStyles.sectionTitleTextStyle,
            ),
            const SizedBox(
                height: SizeConstants.spacingBetweenProjectTitleAndDescription),
            Text(
              mechatronicsProject.description,
              textAlign: TextAlign.center,
            ),
            mechatronicsProject.videosUrl != ''
                ? Column(
                    children: [
                      const SizedBox(
                        height: 24.0,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () async {
                            await launchUrlString(
                                mechatronicsProject.videosUrl);
                          },
                          child: const Text('Watch on YouTube'),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 48.0),
            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              runSpacing: SizeConstants
                  .mechatronicsProjectsVerticaalSpacingBetweenThumbnails,
              spacing: SizeConstants
                  .mechatronicsProjectsHorizontalSpacingBetweenThumbnails,
              children: mechatronicsProject.projectImagesPaths
                  .map(
                    (projectImagePath) => Image.asset(projectImagePath,
                        width: SizeConstants
                            .mechatronicsProjectVideoThumbnailWidth,
                        filterQuality: FilterQuality.medium),
                  )
                  .toList(),

              // (context, index) {
              //   return Container(
              //     color: AppColors.pageSecondaryBackgroundColor,
              //     height: SizeConstants.mechatronicsProjectVideoThumbnailHeight,
              //     width: SizeConstants.mechatronicsProjectVideoThumbnailWidth,
              //     child: Image.asset(
              //       mechatronicsProject.projectImagesPaths[index],
              //     ),
              //   );
              // },
            )
          ],
        ),
      ),
    );
  }
}
