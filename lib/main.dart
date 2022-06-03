import 'package:flutter/material.dart';
import 'app.dart';
import 'package:giovani_debiagi_webpage/core/injection_container.dart'
    as injection_container;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection_container.init();

  runApp(const App());
}
