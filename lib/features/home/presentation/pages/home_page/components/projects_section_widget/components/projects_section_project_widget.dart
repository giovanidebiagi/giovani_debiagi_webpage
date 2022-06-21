import 'package:flutter/material.dart';
import '../../../../../../../../core/app_colors.dart';

class ProjectsSectionProjectWidget extends StatefulWidget {
  const ProjectsSectionProjectWidget(
      {Key? key, required this.name, required this.imagePath, required this.pageRoute})
      : super(key: key);

  final String name;
  final String imagePath;
  final String pageRoute;

  @override
  State<ProjectsSectionProjectWidget> createState() => _ProjectsSectionProjectWidgetState();
}

class _ProjectsSectionProjectWidgetState extends State<ProjectsSectionProjectWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, widget.pageRoute);
        },
        child: Container(
          color: AppColors.pageSecondaryBackgroundColor,
          // width: double.infinity,
          height: 300.0,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              widget.imagePath,
              height: 45,
              width: 45,
              color: _isHovered ? AppColors.primaryColor : AppColors.defaultTextColor,
              filterQuality: FilterQuality.medium,
            ),
            const SizedBox(height: 18.0),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isHovered ? AppColors.primaryColor : AppColors.defaultTextColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
