import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';

class HistoryItem extends StatelessWidget {
  final VoidCallback? onTap;

  const HistoryItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: AppColors.primaryColor.withOpacity(0.25),
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "#1003 ",
                  style: TextStyle(fontSize: 12),
                ),
                5.verticalSpace,
                const Text(
                  "•",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                5.verticalSpace,
                const Text(
                  " 11:19 AM",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            5.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Perdana 10GB",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      50000.currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                3.verticalSpace,
                const Text(
                  "10 items",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 4.h),
    //   margin: EdgeInsets.only(bottom: 12.h),
    //   decoration: BoxDecoration(
    //     color: theme.primaryColor.withOpacity(0.2),
    //     borderRadius: BorderRadius.circular(15.r),
    //   ),
    //   child: ListTile(
    //     title: Text(
    //       'New History received\nyour cart waiting for checkout',
    //       style: theme.textTheme.displaySmall?.copyWith(
    //         fontWeight: FontWeight.normal,
    //       ),
    //     ),
    //     subtitle: Padding(
    //       padding: EdgeInsets.only(top: 5.h),
    //       child: Text(
    //         '10/06/2022 AT 05:30 PM',
    //         style: theme.textTheme.bodyMedium?.copyWith(
    //           fontSize: 12.sp,
    //         ),
    //       ),
    //     ),
    //     leading: Container(
    //       width: 60.w,
    //       height: 60.h,
    //       decoration: BoxDecoration(
    //         color: theme.primaryColor,
    //         borderRadius: BorderRadius.circular(12.r),
    //       ),
    //       child: Center(
    //         child: SvgPicture.asset(
    //           Constants.notificationsIcon,
    //           // ignore: deprecated_member_use
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
