import 'dart:async';
import 'package:flutter/material.dart';

class AppNavigationBloc {
  final innerNavigatorKey = GlobalKey<NavigatorState>();

  final _currentInnerRouteStreamController = StreamController<String>()..add('/home');
  Stream<String> get currentInnerRouteStream => _currentInnerRouteStreamController.stream;

  setCurrentInnerRoute(String routeName) {
    _currentInnerRouteStreamController.add(routeName);
  }
}
