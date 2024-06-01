import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/screen_title.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/shimmer_widget.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/widgets/no_data.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final theme = context.theme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                20.verticalSpace,
                const ScreenTitle(
                  title: 'Keranjang',
                ),
                5.verticalSpace,
                Obx(() {
                  return Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Total Barang: ${controller.listKeranjang.length}",
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  );
                }),
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
                              child: Material(
                                child: RefreshIndicator(
                                  color: AppColors.primaryColor,
                                  onRefresh: () async {
                                    controller.onRefreshKeranjang();
                                  },
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 10,
                                    ),
                                    itemCount: controller.listKeranjang.length,
                                    itemBuilder: (context, index) {
                                      final product =
                                          controller.listKeranjang[index];
                                      return Dismissible(
                                        key: ValueKey(product.namaBarang),
                                        onDismissed: (direction) async {
                                          controller.onDeletePressed(
                                              product.idKeranjang!);
                                        },
                                        background: Container(
                                            color: Colors.red,
                                            child: const Icon(
                                                Icons.delete_forever,
                                                color: Colors.white)),
                                        direction: DismissDirection.endToStart,
                                        child: CartItem(
                                          onDeacreasePressed: () {
                                            controller.decreaseQuantity(
                                                index, product.idKeranjang!);
                                          },
                                          onIncreasePressed: () {
                                            controller.increaseQuantity(
                                                index, product.idKeranjang!);
                                          },
                                          quantityController:
                                              TextEditingController(
                                                  text: product.quantity
                                                      .toString()),
                                          item: product,
                                          onChanged: (value) {
                                            controller.debounceC.run(() {
                                              controller
                                                  .onInputItemCart(
                                                      product.idKeranjang!,
                                                      int.parse(value))
                                                  .then((_) => controller
                                                      .onRefreshKeranjang());
                                            });
                                          },
                                          onDeletePressed: () {
                                            controller.onDeletePressed(
                                                product.idKeranjang!);
                                          },
                                        ).animate().fade().slideX(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              begin: -1,
                                              curve: Curves.easeInSine,
                                            ),
                                      );
                                    },
                                  ),
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
      ),
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
                      controller.totalPayment().currencyFormatRp,
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
                  width: MediaQuery.of(context).size.width,
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
