import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/common/error_state_widget.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

import '../../../global/common/screen_title.dart';
import '../controllers/history_controller.dart';
import 'widgets/history_item.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            15.verticalSpace,
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: ScreenTitle(
                title: 'History Pesanan',
                dividerEndIndent: 150,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DefaultTabController(
                    length: 3,
                    initialIndex: controller.selectedIndex.value,
                    child: Column(
                      children: [
                        TabBar(
                          automaticIndicatorColorAdjustment: true,
                          onTap: (value) {
                            controller.selectedIndex.value = value;
                            debugPrint(
                                "index : ${controller.selectedIndex.value.toString()}");
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
                          tabs: const [
                            Text("Proses"),
                            Text("Selesai"),
                            Text("Dibatalkan"),
                          ],
                          isScrollable: true,
                        ),
                        10.verticalSpace,
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TabBarView(
                              clipBehavior: Clip.hardEdge,
                              children: [
                                // TAB 1
                                ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) =>
                                      const HistoryItem()
                                          .animate()
                                          .fade()
                                          .slideY(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            begin: 1,
                                            curve: Curves.easeInSine,
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
            ),
          ],
        ),
      );
    });
  }
}
