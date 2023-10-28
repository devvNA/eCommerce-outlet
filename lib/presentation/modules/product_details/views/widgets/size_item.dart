import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key,
    required this.onPressed,
    required this.label,
    this.selected = false,
  });

  final void Function()? onPressed;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: selected ? theme.primaryColor : theme.colorScheme.background,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            label,
            style: theme.textTheme.displaySmall?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
