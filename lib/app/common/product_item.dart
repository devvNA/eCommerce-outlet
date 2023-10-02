// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../data/models/product_model.dart';
import '../modules/base/controllers/base_controller.dart';
import '../routes/app_pages.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

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
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  product.image!,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  12.0,
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Text(product.name!, style: theme.textTheme.bodyMedium)
              .animate()
              .fade()
              .slideY(
                duration: const Duration(milliseconds: 200),
                begin: 1,
                curve: Curves.easeInSine,
              ),
          5.verticalSpace,
          Text('Rp${product.price}', style: theme.textTheme.displaySmall)
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
