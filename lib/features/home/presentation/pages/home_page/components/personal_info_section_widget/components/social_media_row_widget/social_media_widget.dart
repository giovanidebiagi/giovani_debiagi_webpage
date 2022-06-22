import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../../../../core/app_colors.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget(
      {Key? key, required this.imagePath, required this.url})
      : super(key: key);

  final String imagePath;
  final String url;

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          _isHovered = false;
        });
      },
      child: InkWell(
        onTap: () async {
          await launchUrlString(widget.url);
        },
        child: Image.asset(
          widget.imagePath,
          color: _isHovered ? AppColors.primaryColor : null,
          height: 32.0,
          filterQuality: FilterQuality.medium,
        ),
      ),
    );
  }
}
