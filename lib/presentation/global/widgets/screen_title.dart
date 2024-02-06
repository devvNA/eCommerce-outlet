import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final double? dividerEndIndent;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final VoidCallback? onTapLeading;

  const ScreenTitle({
    super.key,
    required this.title,
    this.dividerEndIndent,
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
    this.onTapLeading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centerTitle! ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment:
              centerTitle! ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            automaticallyImplyLeading!
                ? IconButton(
                    onPressed: onTapLeading,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24.0,
                      color: Colors.black,
                    ),
                  )
                : const SizedBox(),
            Text(title,
                style: context.theme.textTheme.displayLarge?.copyWith(
                  fontSize: 24.sp,
                )),
          ],
        ),
        const Divider(
          thickness: 2.2,
        ),
      ],
    );
  }
}
