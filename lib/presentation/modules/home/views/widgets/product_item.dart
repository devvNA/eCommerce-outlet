// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/home/controllers/home_controller.dart';

import '../../../../../data/models/product/products_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../utils/constants.dart';
import '../../../base/controllers/base_controller.dart';
import '../../../../routes/app_pages.dart';

class ProductItem extends GetView<HomeController> {
  final Products product;
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
            height: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Constants.product1,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Text(product.nama!, style: theme.textTheme.bodyMedium)
              .animate()
              .fade()
              .slideY(
                duration: const Duration(milliseconds: 200),
                begin: 1,
                curve: Curves.easeInSine,
              ),
          Text('Rp ${product.harga}', style: theme.textTheme.displaySmall)
              .animate()
              .fade()
              .slideY(
                duration: const Duration(milliseconds: 200),
                begin: 2,
                curve: Curves.easeInSine,
              ),
        ],
      ),
    );
  }
}
