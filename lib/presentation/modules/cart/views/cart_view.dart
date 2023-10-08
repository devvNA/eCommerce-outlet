import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../global/utils/constants.dart';
import '../../../global/common/custom_button.dart';
import '../../../global/common/custom_snackbar.dart';
import '../../../global/common/no_data.dart';
import '../../../global/common/screen_title.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<CartController>(
          builder: (_) => ListView(
            children: [
              30.verticalSpace,
              const ScreenTitle(
                title: 'Keranjang',
                dividerEndIndent: 280,
              ),
              25.verticalSpace,
              controller.products.isEmpty
                  ? NoData(
                      text: 'Belum ada produk di keranjang!',
                      onPressed: () {
                        controller.onEmptyCartPressed();
                      },
                    )
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => CartItem(
                        product: controller.products[index],
                      ).animate().fade().slideX(
                            duration: const Duration(milliseconds: 300),
                            begin: -1,
                            curve: Curves.easeInSine,
                          ),
                      shrinkWrap: true,
                      primary: false,
                    ),
              30.verticalSpace,
              Visibility(
                visible: controller.products.isNotEmpty,
                child: Row(
                  children: [
                    Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Constants.busIcon),
                          5.verticalSpace,
                          Text('FREE',
                              style: theme.textTheme.displaySmall?.copyWith(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total:',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 18.sp,
                            )),
                        10.verticalSpace,
                        Text(
                          'Rp${controller.total.toStringAsFixed(0)}',
                          style: theme.textTheme.displayLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                theme.primaryColor.withOpacity(0.5),
                            decorationThickness: 1,
                            color: Colors.transparent,
                            shadows: [
                              Shadow(
                                  color: theme.textTheme.displayLarge!.color!,
                                  offset: const Offset(0, -5)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              30.verticalSpace,
              Visibility(
                visible: controller.products.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CustomButton(
                    text: 'Pesan sekarang',
                    onPressed: () {
                      controller.onPurchaseNowPressed();
                      CustomSnackBar.showCustomSnackBar(
                          color: Colors.green,
                          title: 'Purchased',
                          message: 'Order placed with success',
                          duration: const Duration(seconds: 2));
                    },
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
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
