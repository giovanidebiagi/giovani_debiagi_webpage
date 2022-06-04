import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';

class HomePageSectionTemplate extends StatelessWidget {
  const HomePageSectionTemplate({Key? key, required this.child, required this.color})
      : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            width: 800.0,
            child: Padding(
              padding: const EdgeInsets.only(
                top: SizeConstants.defaultSectionInnerTopPadding,
                bottom: SizeConstants.defaultSectionInnerBottomPadding,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
