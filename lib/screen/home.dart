import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webjeep/core/home_controller.dart';
import 'package:webjeep/responsive.dart';

import 'widget/side_menu.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SideMenu(),
      body: GetX<HomeController>(
        init: HomeController(
          scaffoldKey: globalKey,
        ),
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appBar(context, controller),
                  bodyBar(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget appBar(BuildContext context, HomeController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.7),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          !Responsive.isDesktop(context)
              ? Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(
                          controller.listMenu != null
                              ? controller.listMenu!.length
                              : 0,
                          (index) => MouseRegion(
                            onHover: (mouse) {
                              controller.mouseHover(index, context);
                            },
                            onExit: (mouse) {
                              controller.mouseExit();
                            },
                            child: GestureDetector(
                              onTap: () => controller.openDrawer(globalKey),
                              child: Text(
                                controller.listMenu![index],
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w800,
                                  color: controller.i.value == index &&
                                          controller.isActive.value
                                      ? Colors.orange.shade800
                                      : Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget bodyBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
