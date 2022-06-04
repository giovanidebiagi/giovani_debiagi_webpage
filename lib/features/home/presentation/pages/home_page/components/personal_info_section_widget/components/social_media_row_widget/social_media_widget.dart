import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../../../../core/app_colors.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget(
      {Key? key, required this.imagePath, required this.url})
      : super(key: key);

  final String imagePath;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrlString(url);
      },
      child: Image.asset(
        imagePath,
        color: AppColors.defaultTextColor,
        height: 32.0,
      ),
    );
  }
}
