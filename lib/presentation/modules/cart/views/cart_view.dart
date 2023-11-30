import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/core/utils/helpers/currency.dart';

import '../../../../core/utils/helpers/constants.dart';
import '../../../global/common/no_data.dart';
import '../../../global/common/screen_title.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<CartController>(
          builder: (_) => Column(
            children: [
              30.verticalSpace,
              const ScreenTitle(
                title: 'Keranjang',
                dividerEndIndent: 280,
              ),
              10.verticalSpace,
              controller.products.isEmpty
                  ? NoData(
                      text: 'Belum ada produk di keranjang!',
                      onPressed: () {
                        controller.onEmptyCartPressed();
                      },
                    )
                  : Expanded(
                      child: SizedBox(
                        child: RefreshIndicator(
                          color: AppColors.primaryColor,
                          onRefresh: () async {},
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const Divider(
                              height: 20,
                              color: Colors.grey,
                            ),
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) => CartItem(
                              product: controller.products[index],
                            ).animate().fade().slideX(
                                  duration: const Duration(milliseconds: 300),
                                  begin: -1,
                                  curve: Curves.easeInSine,
                                ),
                          ),
                        ),
                      ),
                    ),
              Visibility(
                visible: controller.products.isNotEmpty,
                child: Row(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
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
                        5.verticalSpace,
                        Text(
                          CurrencyFormat.convertToIdr(controller.total, 0),
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 20,
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
                        // Text(
                        //   'Rp${controller.total.toStringAsFixed(0)}',
                        //   style: theme.textTheme.displayLarge?.copyWith(
                        //     fontSize: 20,
                        //     decoration: TextDecoration.underline,
                        //     decorationColor:
                        //         theme.primaryColor.withOpacity(0.5),
                        //     decorationThickness: 1,
                        //     color: Colors.transparent,
                        //     shadows: [
                        //       Shadow(
                        //           color: theme.textTheme.displayLarge!.color!,
                        //           offset: const Offset(0, -5)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              10.verticalSpace,
              Visibility(
                visible: controller.products.isNotEmpty,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 1,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.CHECKOUT, arguments: controller);
                    },
                    child: const Text("Checkout"),
                  ),
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInSine,
                    ),
              ),
              10.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
