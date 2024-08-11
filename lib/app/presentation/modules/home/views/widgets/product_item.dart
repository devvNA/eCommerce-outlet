// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/modules/home/controllers/home_controller.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

import '../../../../../data/models/produk_model.dart';
import '../../../base/controllers/base_controller.dart';

class ProductItem extends GetView<HomeController> {
  final Produk produk;
  const ProductItem({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.PRODUCT_DETAILS,
          arguments: produk,
        );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/no-image.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(produk.nama ?? "",
                        maxLines: 2,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                        )),
                    3.verticalSpace,
                    Expanded(
                      child: Text(
                        // ignore: unnecessary_string_interpolations
                        produk.harga?.currencyFormatRp ?? 0.currencyFormatRp,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: _getStockColor(produk.stok ?? 0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Stok: ${produk.stok ?? 0}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 200),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStockColor(int stok) {
    if (stok > 50) return Colors.green;
    if (stok > 5) return Colors.orange;
    return Colors.red;
  }
}
