import 'package:flutter/material.dart';

import '../../../../../app_colors.dart';

class AppNavBarBottomText extends AnimatedWidget {
  final String navBottomText;
  final Animation animation;

  const AppNavBarBottomText(
      {Key? key, required this.navBottomText, required this.animation})
      : super(key: key, listenable: animation);

  Animation get _animation => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pagePrimaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: SizedBox(
          height: 30,
          child: Center(
            child: Row(
              children: navBottomText.split('').asMap().entries.map((e) {
                return Text(
                  e.value,
                  style: TextStyle(
                      fontSize: 14,
                      color: e.key <= _animation.value.floor()
                          ? AppColors.primaryColor
                          : Colors.transparent),
                );
              }).toList(),
            ),
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (context, index) => Text(
            //     navBottomText,
            //     style: const TextStyle(
            //         fontSize: 14, color: AppColors.primaryColor),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
