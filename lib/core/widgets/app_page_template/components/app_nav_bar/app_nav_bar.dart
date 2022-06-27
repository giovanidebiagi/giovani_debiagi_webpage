import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/routes/app_routes.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/components/app_nav_bar_bottom_text.dart';
import 'package:giovani_debiagi_webpage/core/widgets/app_page_template/components/app_nav_bar/components/app_nav_bar_page_button.dart';

import '../../../../app_colors.dart';

class AppNavBar extends StatefulWidget {
  final String currentPageRoute;
  final bool compressed;

  const AppNavBar(
      {Key? key, required this.currentPageRoute, this.compressed = false})
      : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _animation;
  final String _navBarBottomText =
      'This website has been built with Flutter Web.';

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(const Duration(seconds: 2), () {
                _animationController.forward(from: 0);
              });
            }
          });
    _animationController.forward();
    _animation = StepTween(begin: 0, end: _navBarBottomText.length)
        .animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: widget.key,
      backgroundColor: AppColors.pageSecondaryBackgroundColor,
      title: widget.compressed
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppNavBarPageButton(
                      title: 'About me',
                      pageRoute: AppRoutes.homePage,
                      currentPageRoute: widget.currentPageRoute),
                  const SizedBox(width: 48),
                  AppNavBarPageButton(
                      title: 'Flutter Projects',
                      pageRoute: AppRoutes.flutterProjects,
                      currentPageRoute: widget.currentPageRoute),
                  const SizedBox(width: 48),
                  AppNavBarPageButton(
                      title: 'Mechatronics Projects',
                      pageRoute: AppRoutes.mechatronicsProjects,
                      currentPageRoute: widget.currentPageRoute),
                  const SizedBox(width: 48),
                ],
              ),
            ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 96.0),
              child: AppNavBarBottomText(
                  navBottomText: _navBarBottomText, animation: _animation),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// class AppNavBar extends SliverAppBar {
//   final String currentPageRoute;
//   final bool compressed;

//   AppNavBar({Key? key, required this.currentPageRoute, this.compressed = false})
//       : super(
//           key: key,
//           backgroundColor: AppColors.pageSecondaryBackgroundColor,
//           title: compressed
//               ? Container()
//               : Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 48.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       AppNavBarPageButton(
//                           title: 'About me',
//                           pageRoute: AppRoutes.homePage,
//                           currentPageRoute: currentPageRoute),
//                       const SizedBox(width: 48),
//                       AppNavBarPageButton(
//                           title: 'Flutter Projects',
//                           pageRoute: AppRoutes.flutterProjects,
//                           currentPageRoute: currentPageRoute),
//                       const SizedBox(width: 48),
//                       AppNavBarPageButton(
//                           title: 'Mechatronics Projects',
//                           pageRoute: AppRoutes.mechatronicsProjects,
//                           currentPageRoute: currentPageRoute),
//                       const SizedBox(width: 48),
//                     ],
//                   ),
//                 ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   color: AppColors.pagePrimaryBackgroundColor,
//                   child: const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//                     child: Center(
//                       child: Text(
//                         'This website has been developed with Flutter Web',
//                         style: TextStyle(
//                             fontSize: 14, color: AppColors.primaryColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );

// }
