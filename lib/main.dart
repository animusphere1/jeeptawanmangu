import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webjeep/route_generator.dart';
import 'package:webjeep/utils/translation.dart';

void main() {
  init().then(
    (value) {
      if (kIsWeb) {
        runApp(const WebApp());
      }
    },
  );
}

Future<void> init() async {
  // await Future.delayed(const Duration(seconds: 3));
}

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      translations: MultiLanguage(),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: RouteGenerator.routeHome,
    );
  }
}
