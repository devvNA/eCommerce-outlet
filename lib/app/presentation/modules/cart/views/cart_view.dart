import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/shimmer_widget.dart';

import '../../../../routes/app_pages.dart';
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
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: ScreenTitle(
                      title: 'History Pesanan',
                    ),
                  ),
                  8.horizontalSpace,
                  Obx(() {
                    return Badge(
                      label: Text(
                        controller.listKeranjang.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Icon(Icons.shopping_bag_rounded),
                    );
                  }),
                ],
              ),
              const Divider(
                thickness: 2.2,
              ),
              5.verticalSpace,
              Expanded(
                child: Obx(() {
                  if (controller.loading()) {
                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
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
                      Column(
                        children: [
                          Expanded(
                            child: RefreshIndicator(
                              color: AppColors.primaryColor,
                              onRefresh: () async {
                                controller.onRefreshKeranjang();
                              },
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemCount: controller.listKeranjang.length,
                                itemBuilder: (context, index) {
                                  final data = controller.listKeranjang[index];
                                  return CartItem(
                                    initialValue: data.quantity.toString(),
                                    onChanged: (value) {
                                      controller.debounceC.run(() {
                                        controller
                                            .onUpdateItemCart(
                                                data.id!, int.parse(value))
                                            .then((_) => controller
                                                .onRefreshKeranjang());
                                      });
                                    },
                                    namaProduk: data.id.toString(),
                                    onDecreasePressed: () => controller
                                        .onDecreasePressed(data.idProduk!),
                                    onIncreasePressed: () => controller
                                        .onIncreasePressed(data.idProduk!),
                                    onDeletePressed: () async {
                                      controller.onDeletePressed(data.id!);
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      log("delete Id_produk = ${data.id}");
                                      log("total produk di keranjang = ${controller.listKeranjang.length}");
                                    },
                                  ).animate().fade().slideX(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        begin: -1,
                                        curve: Curves.easeInSine,
                                      );
                                },
                              ),
                            ),
                          ),
                          70.verticalSpace
                        ],
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
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total:',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 10,
                          color: AppColors.h4,
                        )),
                    Text(
                      500000.currencyFormatRp,
                      style: theme.textTheme.displayMedium
                          ?.copyWith(color: AppColors.h2, fontSize: 16),
                    ),
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              5.verticalSpace,
              Expanded(
                child: SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 1,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.CHECKOUT,
                          arguments: controller.listKeranjang());
                    },
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInSine,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
