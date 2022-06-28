import 'package:flutter/material.dart';

import '../../../../../../core/size_constants.dart';

class HomePageSectionWidget extends StatelessWidget {
  const HomePageSectionWidget(
      {Key? key, required this.child, required this.color})
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: 800.0,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: SizeConstants.defaultSectionInnerTopPadding,
                  bottom: SizeConstants.defaultSectionInnerBottomPadding,
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
