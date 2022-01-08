import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webjeep/screen/home.dart';

class RouteGenerator {
  static const routeHome = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case routeHome:
        return GetPageRoute(page: () => HomeScreen());
      default:
        return GetPageRoute(page: () => HomeScreen());
    }
  }
}
