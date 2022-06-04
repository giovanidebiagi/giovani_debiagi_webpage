import 'package:flutter/material.dart';

import '../../app_colors.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagePrimaryBackgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
