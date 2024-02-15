import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/core/utils/helpers/currency.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

class HistoryItem extends StatelessWidget {
  final VoidCallback? onTap;

  const HistoryItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget spaceH = const SizedBox(
      width: 5.0,
    );
    Widget spaceV = const SizedBox(
      width: 5.0,
    );

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
                  "#1003",
                  style: TextStyle(fontSize: 12),
                ),
                spaceH,
                const Text(
                  "•",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spaceH,
                const Text(
                  "11:19 AM",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            spaceV,
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
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(50000),
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "10 items",
                  style: TextStyle(
                    fontSize: 13.0,
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
