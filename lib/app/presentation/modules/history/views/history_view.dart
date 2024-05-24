import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/error_state_widget.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

import '../../../global/widgets/screen_title.dart';
import '../controllers/history_controller.dart';
import 'widgets/history_item.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                20.verticalSpace,
                const ScreenTitle(
                  title: 'History Pesanan',
                ),
                Expanded(
                  child: DefaultTabController(
                      length: 3,
                      initialIndex: controller.selectedIndex.value,
                      child: Column(
                        children: [
                          TabBar(
                            automaticIndicatorColorAdjustment: true,
                            onTap: (value) {
                              controller.selectedIndex.value = value;
                              log("tab : ${value + 1}");
                            },
                            labelStyle:
                                context.theme.textTheme.displayLarge?.copyWith(
                              fontSize: 15.sp,
                            ),
                            indicator: const UnderlineTabIndicator(
                              insets: EdgeInsets.symmetric(horizontal: 15.0),
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 2.5),
                            ),
                            labelColor: AppColors.primaryColor,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 12,
                            ),
                            unselectedLabelColor: const Color(0xFFA3A3A3),
                            tabs: controller.tabs,
                            isScrollable: true,
                          ),
                          5.verticalSpace,
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TabBarView(
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  // TAB 1
                                  RefreshIndicator(
                                    color: AppColors.primaryColor,
                                    onRefresh: () async {},
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                                  height: 4,
                                                  color: Colors.black45)
                                              .animate()
                                              .fade()
                                              .slideY(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                begin: 2,
                                                curve: Curves.easeInSine,
                                              ),
                                      itemCount: 3,
                                      itemBuilder: (context, index) =>
                                          HistoryItem(
                                        onTap: () {
                                          Get.toNamed(Routes.DETAIL_HISTORY);
                                        },
                                      ).animate().fade().slideY(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                begin: 1,
                                                curve: Curves.easeInSine,
                                              ),
                                    ),
                                  ),

                                  // TAB 2
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ErrorStateWidget(
                                          message: "Belum ada history"),
                                    ],
                                  ),

                                  // TAB 3
                                  const ErrorStateWidget(
                                      message: "Belum ada history"),
                                ]),
                          )),
                        ],
                      )),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
