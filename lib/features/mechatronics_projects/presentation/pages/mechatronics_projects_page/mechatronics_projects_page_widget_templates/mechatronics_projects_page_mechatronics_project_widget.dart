import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/app_colors.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../../../core/text_styles.dart';

class MechatronicsProjectsPageMechatronicsProjectWidget extends StatelessWidget {
  const MechatronicsProjectsPageMechatronicsProjectWidget(
      {Key? key, required this.mechatronicsProject})
      : super(key: key);

  final MechatronicsProject mechatronicsProject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.pageSecondaryBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48.0),
            child: SizedBox(
              width: SizeConstants.mechatronicsProjectVideoThumbnailWidth +
                  48 +
                  SizeConstants.mechatronicsProjectsDescriptionWidgetWidth,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12.0,
                      ),
                      shrinkWrap: true,
                      itemCount: mechatronicsProject.projectImagesPaths.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: AppColors.pagePrimaryBackgroundColor,
                          height: SizeConstants.mechatronicsProjectVideoThumbnailHeight,
                          width: SizeConstants.mechatronicsProjectVideoThumbnailWidth,
                          child: Image.asset(
                            mechatronicsProject.projectImagesPaths[index],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 48.0,
                  ),
                  SizedBox(
                    height: mechatronicsProject.projectImagesPaths.length *
                            SizeConstants.mechatronicsProjectVideoThumbnailHeight +
                        (mechatronicsProject.projectImagesPaths.length - 1) *
                            SizeConstants.verticalSpacingBetweenMechatronicsProjectsThumbnails,
                    width: SizeConstants.mechatronicsProjectsDescriptionWidgetWidth,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            mechatronicsProject.name,
                            style: TextStyles.sectionTitleTextStyle,
                          ),
                        ),
                        const SizedBox(
                            height: SizeConstants.spacingBetweenProjectTitleAndDescription),
                        Text(
                          mechatronicsProject.description,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                            height: SizeConstants.spacingBetweenProjectDescriptionAndBottomButton),
                        mechatronicsProject.videosUrl != ''
                            ? ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                ),
                                onPressed: () async {
                                  await launchUrlString(mechatronicsProject.videosUrl);
                                },
                                child: const Text('Watch on YouTube'),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
