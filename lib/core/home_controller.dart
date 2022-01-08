import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;

  RxList<String>? listMenu;

  RxInt i = 0.obs;
  RxBool isActive = false.obs;

  HomeController({@required this.scaffoldKey});

  @override
  onInit() {
    super.onInit();

    listMenu = ['Home', 'About', 'Community', 'Contact'].obs;
  }

  openDrawer(GlobalKey<ScaffoldState> globalKey) {
    listMenu![0] = 'agung';
  }

  void mouseHover(int i, BuildContext context) {
    isActive.value = true;
    this.i.value = i;
  }

  void mouseExit() {
    isActive.value = false;
  }
}
