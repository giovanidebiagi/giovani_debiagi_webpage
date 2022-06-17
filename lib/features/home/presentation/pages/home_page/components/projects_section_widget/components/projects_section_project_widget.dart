import 'package:flutter/material.dart';

import '../../../../../../../../core/app_colors.dart';

class ProjectsSectionProjectWidget extends StatelessWidget {
  const ProjectsSectionProjectWidget(
      {Key? key, required this.name, required this.imagePath})
      : super(key: key);

  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to Flutter or Mechatronics Projects Page
      },
      child: Container(
        color: AppColors.pageSecondaryBackgroundColor,
        width: double.infinity,
        height: 200.0,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            imagePath,
            height: 45,
            width: 45,
            color: AppColors.defaultTextColor,
            filterQuality: FilterQuality.medium,
          ),
          const SizedBox(height: 18.0),
          Text(
            name,
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
