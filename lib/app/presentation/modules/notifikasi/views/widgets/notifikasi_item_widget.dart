import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        title: Text(
          'Pemberitahuan baru\nmenunggu pembayaran',
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            '10/06/2022 AT 05:30 PM',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
        leading: Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: const Center(
            child: Icon(
              Icons.info_outline,
              size: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
