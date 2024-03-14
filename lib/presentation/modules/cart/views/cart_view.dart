import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/core/utils/helpers/constants.dart';
import 'package:marvelindo_outlet/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/presentation/global/widgets/shimmer_widget.dart';
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
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              20.verticalSpace,
              const ScreenTitle(
                title: 'Keranjang',
                dividerEndIndent: 280,
              ),
              10.verticalSpace,
              Expanded(
                child: Obx(() {
                  if (controller.loading()) {
                    return ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) => ShimmerLayout(
                        child: Container(
                          height: 120.0,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  if (controller.listKeranjang.isEmpty) {
                    return NoData(
                      text: 'Belum ada produk di keranjang!',
                      onPressed: controller.onEmptyCartPressed,
                    );
                  }
                  return Stack(
                    children: [
                      RefreshIndicator(
                        color: AppColors.primaryColor,
                        onRefresh: () async {
                          controller.listKeranjang().clear();
                          controller.getKeranjang();
                        },
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: controller.listKeranjang().length,
                          itemBuilder: (context, index) {
                            final keranjang = controller.listKeranjang()[index];
                            return CartItem(
                              harga: 100,
                              kategori: "Voucher",
                              nama: "lorem ipsum",
                              quantity: keranjang.quantity ?? 1,
                              onDecreasePressed: () => controller
                                  .onDecreasePressed(keranjang.idProduk!),
                              onIncreasePressed: () => controller
                                  .onIncreasePressed(keranjang.idProduk!),
                            ).animate().fade().slideX(
                                  duration: const Duration(milliseconds: 300),
                                  begin: -1,
                                  curve: Curves.easeInSine,
                                );
                          },
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: _checkoutBox(theme, context),
                          ),
                          10.verticalSpace
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          )),
    );
  }

  Visibility _checkoutBox(ThemeData theme, BuildContext context) {
    return Visibility(
      visible: controller.listKeranjang.isNotEmpty,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: controller.listKeranjang.isNotEmpty,
                child: Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
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
                    15.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total:',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 14.sp,
                            )),
                        5.verticalSpace,
                        Text(
                          'Rp${controller.total.toStringAsFixed(0)}',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 18,
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
              5.verticalSpace,
              SizedBox(
                width: Get.width,
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
            ],
          ),
        ),
      ),
    );
  }
}
