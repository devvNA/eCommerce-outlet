// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/modules/home/controllers/home_controller.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';
import '../../../../../core/utils/helpers/currency.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../data/models/produk/produk_model.dart';
import '../../../base/controllers/base_controller.dart';

class ProductItem extends GetView<HomeController> {
  final Produk product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product);
      },
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://s4.bukalapak.com/img/43229784103/s-463-463/data.jpeg.webp",
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
                    Text(product.nama,
                        maxLines: 2,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13,
                        )),
                    Text(
                      // ignore: unnecessary_string_interpolations
                      "${CurrencyFormat.convertToIdr(product.harga)}",
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    )
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
}
