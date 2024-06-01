// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';

import '../../../../../data/models/histori_pemesanan_model.dart';

class HistoryItem extends StatelessWidget {
  final VoidCallback? onTap;
  final HistoriPemesanan historiData;

  const HistoryItem({
    super.key,
    this.onTap,
    required this.historiData,
  });

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
                Text(
                  "#TRS-${historiData.id}",
                  style: const TextStyle(fontSize: 12),
                ),
                5.verticalSpace,
                const Text(
                  " • ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                5.verticalSpace,
                Text(
                  historiData.tanggal,
                  style: const TextStyle(fontSize: 11),
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
                    Text(
                      "Produk ${historiData.detailProduk[0].idProduk.toString()}",
                      // "Perdana 10GB",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      historiData.total.currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                3.verticalSpace,
                Row(
                  children: [
                    Text(
                      "${historiData.detailProduk.length.toString()} item",
                      style: const TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                    5.horizontalSpace,
                    PaymentChipType(historiData: historiData),
                  ],
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

class PaymentChipType extends StatelessWidget {
  const PaymentChipType({
    super.key,
    required this.historiData,
  });

  final HistoriPemesanan historiData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
      decoration: BoxDecoration(
        color: historiData.tipePayment == "COD"
            ? const Color.fromARGB(255, 229, 174, 10)
            : const Color.fromARGB(255, 53, 70, 165),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            32.0,
          ),
        ),
      ),
      child: Text(
        historiData.tipePayment,
        style: const TextStyle(
          fontSize: 8,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
