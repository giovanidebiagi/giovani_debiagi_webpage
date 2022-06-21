import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import '../../../../../app_colors.dart';

class DrawerMenuButton extends StatefulWidget {
  const DrawerMenuButton(
      {Key? key, required this.title, required this.pageRoute, required this.currentPageRoute})
      : super(key: key);

  final String title;
  final String pageRoute;
  final String currentPageRoute;

  @override
  State<DrawerMenuButton> createState() => _DrawerMenuButtonState();
}

class _DrawerMenuButtonState extends State<DrawerMenuButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final _translate = Matrix4.identity()..translate(0, -6, 0);
    final _dontTranslate = Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: SizedBox(
        height: SizeConstants.appDrawerMenuButtonHeight,
        child: InkWell(
          hoverColor: AppColors.pageSecondaryBackgroundColor,
          onTap: () {
            Navigator.pushNamed(context, widget.pageRoute);
          },
          child: AnimatedContainer(
            color: AppColors.pageSecondaryBackgroundColor,
            duration: const Duration(milliseconds: 150),
            transform: _isHovered ? _translate : _dontTranslate,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                color: _isHovered || (widget.currentPageRoute == widget.pageRoute)
                    ? AppColors.primaryColor
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
