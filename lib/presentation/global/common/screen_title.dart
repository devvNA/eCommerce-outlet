import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final double? dividerEndIndent;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;

  const ScreenTitle({
    Key? key,
    required this.title,
    this.dividerEndIndent,
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centerTitle! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(title,
            style: context.theme.textTheme.displayLarge?.copyWith(
              fontSize: 28.sp,
            )),
        const Divider(
          thickness: 2.2,
        ),
      ],
    );
  }
}
