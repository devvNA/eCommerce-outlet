// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';
import '../../../../core/utils/helpers/constants.dart';
import '../../../../core/utils/helpers/dummy_helper.dart';
import '../controllers/base_controller.dart';
import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../history/views/history_view.dart';
import '../../settings/views/settings_view.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;

    return GetBuilder<BaseController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return controller.onBack();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: chatApp(
            onPressed: () async {
              _showBottomChat(context);
            },
          ),
          body: SafeArea(
            child: IndexedStack(
              clipBehavior: Clip.hardEdge,
              index: controller.currentIndex.value,
              children: const [
                HomeView(),
                CartView(),
                HistoryView(),
                SettingsView(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              child: BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                backgroundColor: theme.scaffoldBackgroundColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  _mBottomNavItem(
                    label: 'Home',
                    icon: Constants.homeIcon,
                  ),
                  _mBottomNavItem(
                    label: 'Cart',
                    icon: Constants.cartIcon,
                  ),
                  _mBottomNavItem(
                    label: 'Notifications',
                    icon: Constants.historyIcon,
                  ),
                  _mBottomNavItem(
                    label: 'Settings',
                    icon: Constants.settingsIcon,
                  ),
                ],
                onTap: controller.changeScreen,
              ),
            ),
          ),
        ),
      );
    });
  }

  _mBottomNavItem({required String label, required String icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon:
          SvgPicture.asset(icon, color: Get.theme.iconTheme.color, height: 20),
      activeIcon: SvgPicture.asset(
        icon,
        color: Get.theme.primaryColor,
        height: 18,
      ),
    );
  }
}

Widget chatApp({required VoidCallback onPressed}) {
  return FloatingActionButton(
    isExtended: true,
    mini: true,
    tooltip: "Chat",
    backgroundColor: AppColors.primaryColor,
    clipBehavior: Clip.none,
    onPressed: onPressed,
    child: const Icon(
      Icons.chat_outlined,
      color: Colors.white,
    ),
  );
}

void _showBottomChat(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    onTap: () {
                      Get.toNamed(Routes.CHAT);
                    },
                    title: Text(user["name"]),
                    subtitle: Text(user["email"]),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        user["photo"],
                      ),
                    ),
                    trailing: const Text(
                      '9:45 PM',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      });
}
