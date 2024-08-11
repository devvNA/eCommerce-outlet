// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;

    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          return controller.onBack();
        },
        child: Scaffold(
          body: controller.pages[controller.currentIndex()],
          // body: SafeArea(
          //   child: IndexedStack(
          //     clipBehavior: Clip.antiAlias,
          //     index: controller.currentIndex(),
          //     children: controller.pages(),
          //   ),
          // ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 24,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GNav(
                  selectedIndex: controller.currentIndex(),
                  onTabChange: (value) {
                    controller.changeScreen(controller.currentIndex(value));
                  },
                  rippleColor:
                      Colors.white, // tab button ripple color when pressed
                  hoverColor: Colors.white, // tab button hover color
                  activeColor: Colors.white,
                  tabBackgroundColor: AppColors.primaryColor,
                  gap: 4,
                  tabBorderRadius: 14,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.all(14),
                  color: Colors.grey,
                  curve: Curves.easeOutExpo, // tab animation curves
                  iconSize: 25, // tab button icon size
                  tabs: const [
                    GButton(
                      icon: Icons.home_filled,
                      text: 'Beranda',
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GButton(
                      icon: Icons.shopping_cart,
                      text: 'Keranjang',
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GButton(
                      icon: Icons.list_alt,
                      text: 'Histori',
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Pengaturan',
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            // child: Padding(
            //   padding: const EdgeInsets.all(12),
            //   child: GNav(
            //       selectedIndex: controller.currentIndex(),
            //       onTabChange: (value) {
            //         controller.changeScreen(controller.currentIndex(value));
            //       },
            //       rippleColor:
            //           Colors.white, // tab button ripple color when pressed
            //       hoverColor: Colors.white, // tab button hover color
            //       activeColor: Colors.white,
            //       tabBackgroundColor: AppColors.primaryColor,
            //       gap: 4,
            //       tabBorderRadius: 14,
            //       textStyle: const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       padding: const EdgeInsets.all(14),
            //       color: Colors.grey,
            //       curve: Curves.easeOutExpo, // tab animation curves
            //       iconSize: 25, // tab button icon size
            //       tabs: const [
            //         GButton(
            //           icon: Icons.home_filled,
            //           text: 'Beranda',
            //           textStyle: TextStyle(
            //             fontSize: 12,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         GButton(
            //           icon: Icons.shopping_cart,
            //           text: 'Keranjang',
            //           textStyle: TextStyle(
            //             fontSize: 12,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         GButton(
            //           icon: Icons.list_alt,
            //           text: 'Histori',
            //           textStyle: TextStyle(
            //             fontSize: 12,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         GButton(
            //           icon: Icons.settings,
            //           text: 'Pengaturan',
            //           textStyle: TextStyle(
            //             fontSize: 12,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ]),
            // ),
          ),
        ),
      );
    });
  }
}
