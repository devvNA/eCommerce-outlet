import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/error_state_widget.dart';
import 'package:marvelindo_outlet/app/presentation/modules/history/views/widgets/history_item.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/widgets/screen_title.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                20.verticalSpace,
                const ScreenTitle(
                  title: 'History Pemesanan',
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
                              child: TabBarView(
                                  clipBehavior: Clip.hardEdge,
                                  children: [
                                // TAB 1
                                Obx(() {
                                  if (controller.loading()) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (controller.listHistoriProses.isEmpty) {
                                    return const Center(
                                        child: ErrorStateWidget(
                                            message:
                                                "Belum ada histori pemesanan yang diproses"));
                                  }
                                  return RefreshIndicator(
                                    color: AppColors.primaryColor,
                                    onRefresh: () =>
                                        controller.onRefreshHistoriPemesanan(),
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                                height: 3,
                                                color: Colors.black45)
                                            .animate()
                                            .fade()
                                            .slideY(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: 2,
                                              curve: Curves.easeInSine,
                                            );
                                      },
                                      itemCount:
                                          controller.listHistoriProses.length,
                                      itemBuilder: (context, index) {
                                        final historiPemesanan =
                                            controller.listHistoriProses[index];

                                        return HistoryItem(
                                          historiData: historiPemesanan,
                                          onTap: () {
                                            Get.toNamed(Routes.DETAIL_HISTORY,
                                                arguments: historiPemesanan);
                                          },
                                        ).animate().fade().slideY(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: 1,
                                              curve: Curves.easeInSine,
                                            );
                                      },
                                    ),
                                  );
                                }),

                                // TAB 2
                                Obx(() {
                                  if (controller.loading()) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (controller.listHistoriSelesai.isEmpty) {
                                    return const Center(
                                        child: ErrorStateWidget(
                                            message:
                                                "Belum ada histori pemesanan yang selesai"));
                                  }
                                  return RefreshIndicator(
                                    color: AppColors.primaryColor,
                                    onRefresh: () =>
                                        controller.onRefreshHistoriPemesanan(),
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                                height: 3,
                                                color: Colors.black45)
                                            .animate()
                                            .fade()
                                            .slideY(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: 2,
                                              curve: Curves.easeInSine,
                                            );
                                      },
                                      itemCount:
                                          controller.listHistoriSelesai.length,
                                      itemBuilder: (context, index) {
                                        final historiPemesanan = controller
                                            .listHistoriSelesai[index];

                                        return HistoryItem(
                                          historiData: historiPemesanan,
                                          onTap: () {
                                            Get.toNamed(Routes.DETAIL_HISTORY,
                                                arguments: historiPemesanan);
                                          },
                                        ).animate().fade().slideY(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: 1,
                                              curve: Curves.easeInSine,
                                            );
                                      },
                                    ),
                                  );
                                }),
                                // TAB 3
                                Obx(() {
                                  if (controller.loading()) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (controller
                                      .listHistoriDibatalkan.isEmpty) {
                                    return const Center(
                                        child: ErrorStateWidget(
                                            message:
                                                "Belum ada histori pemesanan yang dibatalkan"));
                                  }
                                  return RefreshIndicator(
                                    color: AppColors.primaryColor,
                                    onRefresh: () =>
                                        controller.onRefreshHistoriPemesanan(),
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                                height: 3,
                                                color: Colors.black45)
                                            .animate()
                                            .fade()
                                            .slideY(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: 2,
                                              curve: Curves.easeInSine,
                                            );
                                      },
                                      itemCount: controller
                                          .listHistoriDibatalkan.length,
                                      itemBuilder: (context, index) {
                                        final historiPemesanan = controller
                                            .listHistoriDibatalkan[index];

                                        return HistoryItem(
                                          historiData: historiPemesanan,
                                          onTap: () {
                                            Get.toNamed(Routes.DETAIL_HISTORY,
                                                arguments: historiPemesanan);
                                          },
                                        ).animate().fade().slideY(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: 1,
                                              curve: Curves.easeInSine,
                                            );
                                      },
                                    ),
                                  );
                                }),
                              ])),
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
