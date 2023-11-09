// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/modules/home/controllers/home_controller.dart';

import '../../../../../data/models/product/produk_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../core/utils/constants.dart';
import '../../../base/controllers/base_controller.dart';
import '../../../../routes/app_pages.dart';

class ProductItem extends GetView<HomeController> {
  final Produk product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  product.image ?? "https://s4.bukalapak.com/img/43229784103/s-463-463/data.jpeg.webp",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.nama!,
                      maxLines: 2,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          overflow: TextOverflow.ellipsis, fontSize: 13)),
                  Text('Rp ${product.harga}',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: LightThemeColors.primaryColor,
                      ))
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
    );

/*         InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product);
      },
      child: Card(
        elevation: 1,
        shadowColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: LightThemeColors.primaryColor.withOpacity(0.2),
                  image: DecorationImage(
                    image: AssetImage(
                      Constants.product4,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.nama ?? "haha",
                      maxLines: 2,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey),
                    ),
                    Text(
                      'Rp ${product.harga}',
                      style: TextStyle(
                          color: LightThemeColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
 */
  }
}
