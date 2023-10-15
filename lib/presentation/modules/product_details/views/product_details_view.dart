// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

import '../../../global/utils/constants.dart';
import '../../../global/common/custom_button.dart';
import '../controllers/product_details_controller.dart';
import 'widgets/rounded_button.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.product.image!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          onPressed: () => Get.back(),
                          child: SvgPicture.asset(Constants.backArrowIcon,
                              fit: BoxFit.none),
                        ),
                        // GetBuilder<ProductDetailsController>(
                        //   id: 'FavoriteButton',
                        //   builder: (_) => RoundedButton(
                        //     onPressed: () =>
                        //         controller.onFavoriteButtonPressed(),
                        //     child: Align(
                        //       child: SvgPicture.asset(
                        //         controller.product.isFavorite!
                        //             ? Constants.favFilledIcon
                        //             : Constants.favOutlinedIcon,
                        //         width: 16.w,
                        //         height: 15.h,
                        //         color: controller.product.isFavorite!
                        //             ? Colors.white
                        //             : Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  controller.product.name!,
                  style: theme.textTheme.bodyLarge,
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Stok: ${controller.product.stock!.toString()}",
                  style: theme.textTheme.bodyMedium,
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Rp${controller.product.price}',
                      style: theme.textTheme.displayMedium,
                    ),
/*                     Icon(Icons.star_rounded, color: Color(0xFFFFC542)),
                    5.horizontalSpace,
                    Text(
                      controller.product.rating!.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    5.horizontalSpace,
                    Text(
                      '(${controller.product.reviews!})',
                      style:
                          theme.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                    ),
 */
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                child: CustomButton(
                  text: 'Tambahkan ke keranjang',
                  onPressed: () {
                    controller.onAddToCartPressed();
                  },
                  disabled: controller.product.stock! == 0,
                  fontSize: 16.sp,
                  radius: 12.r,
                  verticalPadding: 12.h,
                  hasShadow: true,
                  shadowColor: theme.primaryColor,
                  shadowOpacity: 0.3,
                  shadowBlurRadius: 4,
                  shadowSpreadRadius: 0,
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 300),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
/*               20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Pilih jenis kuota :',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ).animate().fade().slideX(
                      duration: Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
 */
/*               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetBuilder<ProductDetailsController>(
                  id: 'Size',
                  builder: (_) => Row(
                    children: [
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('S'),
                        label: 'S',
                        selected: controller.selectedSize == 'S',
                      ),
                      10.horizontalSpace,
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('M'),
                        label: 'M',
                        selected: controller.selectedSize == 'M',
                      ),
                      10.horizontalSpace,
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('L'),
                        label: 'L',
                        selected: controller.selectedSize == 'L',
                      ),
                      10.horizontalSpace,
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('XL'),
                        label: 'XL',
                        selected: controller.selectedSize == 'XL',
                      ),
                    ],
                  ).animate().fade().slideX(
                        duration: Duration(milliseconds: 300),
                        begin: -1,
                        curve: Curves.easeInSine,
                      ),
                ),
              ),
 */
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  "Deskripsi",
                  textAlign: TextAlign.left,
                  style: theme.textTheme.displaySmall,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 17, left: 12),
              //   child: Text(
              //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              //     textAlign: TextAlign.left,
              //     style: theme.textTheme.bodyMedium,
              //   ),
              // ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 22),
                  child: Text.rich(TextSpan(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: theme.textTheme.bodyMedium,
                      children: const <InlineSpan>[
                        TextSpan(
                            text: ' selengkapnya...',
                            // style: theme.textTheme.displaySmall,
                            style:
                                TextStyle(color: LightThemeColors.primaryColor))
                      ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
