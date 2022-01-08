import 'package:flutter/cupertino.dart';

class Responsive {
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isSizing(BuildContext context) =>
      MediaQuery.of(context).size.width < 1500;
}
