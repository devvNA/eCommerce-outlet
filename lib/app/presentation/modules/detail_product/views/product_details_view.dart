// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/helpers/constants.dart';
import '../../../global/widgets/custom_snackbar.dart';
import '../controllers/product_details_controller.dart';
import 'widgets/round_button.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final theme = context.theme;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, -5),
              blurRadius: 8,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: _addToCartButton(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400.h,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Constants.product2),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r),
                    ),
                  ),
                ),
                Positioned(
                  top: 45.h,
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
                    ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      controller.produk.nama!,
                      style: const TextStyle(
                        color: AppColors.h2,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ).animate().fade().slideX(
                          duration: const Duration(milliseconds: 300),
                          begin: -1,
                          curve: Curves.easeInSine,
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.produk.jenisBarang ?? "Voucher",
                      style: const TextStyle(
                        fontSize: 9.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                ("stok: ${controller.produk.stok.toString()}"),
                // "Stok: ${100}",
                // "Stok: ${controller.product.stock!.toString()}",
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
              ).animate().fade().slideX(
                    duration: const Duration(milliseconds: 300),
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
            ),
            3.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    controller.produk.harga?.currencyFormatRp ??
                        0.currencyFormatRp,
                    style: const TextStyle(
                      color: AppColors.h1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).animate().fade().slideX(
                    duration: const Duration(milliseconds: 300),
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
            ),
            15.verticalSpace,
            Container(
              height: 10,
              color: const Color(0xFFE9E9E9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deskripsi",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  10.verticalSpace,
                  ReadMoreText(
                    controller.produk.deskripsi!,
                    trimLength: 200,
                    colorClickableText: AppColors.primaryColor,
                    isExpandable: true,
                    trimMode: TrimMode.Length,
                    trimCollapsedText: "selengkapnya",
                    trimExpandedText: " tutup",
                  ),
                  // Obx(() {
                  //   return ExpansionPanelList(
                  //     elevation: 3,
                  //     expansionCallback: (int index, bool isExpanded) {
                  //       log(controller.isExpanded.value.toString());
                  //       controller.isExpanded.value =
                  //           !controller.isExpanded.value;
                  //       if (isExpanded) {
                  //         controller.scrollToSelectedContent();
                  //       }
                  //     },
                  //     children: [
                  //       ExpansionPanel(
                  //           headerBuilder:
                  //               (BuildContext context, bool isExpanded) {
                  //             return ListTile(
                  //               title: Text('Header Title'),
                  //             );
                  //           },
                  //           body: ListTile(
                  //             title: Text('Content goes here'),
                  //             subtitle: Text('Details goes here'),
                  //           ),
                  //           isExpanded: controller.isExpanded.value
                  //           // Atur berdasarkan state yang mengontrol expanded atau tidak
                  //           ),
                  //     ],
                  //   );
                  // })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      onPressed: controller.produk.stok! < 1
          ? null
          : () {
              controller.onAddToCart().then((value) =>
                  CustomSnackBar.showCustomSuccessSnackBar(
                      title: "Sukses", message: value));
            },
      child: const Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 20.0,
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              "Tambahkan ke keranjang",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
