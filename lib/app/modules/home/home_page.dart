import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/shared/templates/app_page_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppPageTemplate(
      body: Text('Teste'),
    );
  }
}
