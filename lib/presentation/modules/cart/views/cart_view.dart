import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/core/utils/helpers/constants.dart';
import 'package:marvelindo_outlet/core/utils/helpers/currency.dart';
import 'package:marvelindo_outlet/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';
import '../../../global/widgets/no_data.dart';
import '../../../global/widgets/screen_title.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      bottomNavigationBar: Visibility(
        visible: controller.listKeranjang.isNotEmpty,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 6,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                12.0,
              ),
              topLeft: Radius.circular(
                12.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              5.verticalSpace,
              Visibility(
                visible: controller.listKeranjang.isNotEmpty,
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
                              fontSize: 14.sp,
                            )),
                        5.verticalSpace,
                        Text(
                          CurrencyFormat.convertToIdr(controller.total),
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 16,
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
                        //           offset: Offset(0, -5)),
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
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
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
              5.verticalSpace
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          return Column(
            children: [
              20.verticalSpace,
              const ScreenTitle(
                title: 'Keranjang',
                dividerEndIndent: 280,
              ),
              10.verticalSpace,
              controller.listKeranjang.isEmpty
                  ? NoData(
                      text: 'Belum ada produk di keranjang!',
                      onPressed: controller.onEmptyCartPressed,
                    )
                  : Expanded(
                      child: SizedBox(
                        child: RefreshIndicator(
                          color: AppColors.primaryColor,
                          onRefresh: () async {
                            controller.listKeranjang.clear();
                            controller.getKeranjang();
                          },
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemCount: controller.listKeranjang.length,
                            itemBuilder: (context, index) => CartItem(
                              keranjang: controller.listKeranjang[index],
                            ).animate().fade().slideX(
                                  duration: const Duration(milliseconds: 300),
                                  begin: -1,
                                  curve: Curves.easeInSine,
                                ),
                          ),
                        ),
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
