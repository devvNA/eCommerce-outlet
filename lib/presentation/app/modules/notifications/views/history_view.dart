import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../global/common/screen_title.dart';
import '../controllers/history_controller.dart';
import 'widgets/history_item.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: false,
        clipBehavior: Clip.hardEdge,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          15.verticalSpace,
          const ScreenTitle(
            title: 'History',
            dividerEndIndent: 150,
          ),
          10.verticalSpace,
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) =>
                const HistoryItem().animate().fade().slideY(
                      duration: const Duration(milliseconds: 300),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
            shrinkWrap: true,
            primary: false,
          ),
        ],
      ),
    );
  }
}
