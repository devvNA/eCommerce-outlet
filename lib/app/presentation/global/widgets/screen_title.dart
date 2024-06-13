import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final bool? useDivider;
  final VoidCallback? onTapLeading;

  const ScreenTitle({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
    this.onTapLeading,
    this.useDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment:
            centerTitle! ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: centerTitle!
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (automaticallyImplyLeading!)
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24.0,
                    color: Colors.black,
                  ),
                ),
              Text(title,
                  style: context.theme.textTheme.displayLarge?.copyWith(
                    fontSize: 18.sp,
                  )),
            ],
          ),
          if (useDivider!)
            const Divider(
              thickness: 2.2,
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
