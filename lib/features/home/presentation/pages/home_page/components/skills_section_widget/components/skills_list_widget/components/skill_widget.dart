import 'package:flutter/material.dart';

import '../../../../../../../../../../core/app_colors.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({Key? key, required this.imagePath, required this.name})
      : super(key: key);

  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      color: AppColors.pageSecondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 30,
              width: 30,
              filterQuality: FilterQuality.medium,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
