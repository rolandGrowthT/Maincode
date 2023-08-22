import 'package:flutter/material.dart';

class Navigation {
static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void goto(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }
}