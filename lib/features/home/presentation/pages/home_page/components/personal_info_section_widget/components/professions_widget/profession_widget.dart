import 'package:flutter/material.dart';

import '../../../../../../../../../core/app_colors.dart';

class ProfessionWidget extends StatelessWidget {
  const ProfessionWidget(this.imagePath, this.name, {Key? key})
      : super(key: key);

  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pageSecondaryBackgroundColor,
      height: 120.0,
      width: 120.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 45,
              width: 45,
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
