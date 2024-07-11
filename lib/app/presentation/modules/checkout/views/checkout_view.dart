// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';

import '../../../global/theme/my_colors.dart';
import '../../../global/widgets/custom_alert_dialog.dart';
import '../../../global/widgets/form_text_widget.dart';
import '../../../global/widgets/screen_title.dart';
import '../controllers/checkout_controller.dart';
import 'widgets/checkout_card_widget.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    String imgURL =
        "https://images.tokopedia.net/img/cache/700/VqbcmM/2023/10/10/0e50430c-40e7-4ded-b8ad-23fa364f01f2.png";

    return Scaffold(body: GetBuilder<CheckoutController>(builder: (_) {
      return SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: ScreenTitle(
                automaticallyImplyLeading: true,
                title: 'Checkout',
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 25.0,
                        color: Colors.black,
                      ),
                      5.horizontalSpace,
                      const Text(
                        "Alamat Pengiriman",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  _addressCard(context),
                  20.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.list_alt,
                        size: 25.0,
                        color: Colors.black,
                      ),
                      5.horizontalSpace,
                      const Text(
                        "Detail Pemesanan",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Column(
                    children: List.generate(controller.checkoutProduk.length,
                        (index) {
                      final dataKeranjang = controller.checkoutProduk[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: CheckoutProduct(
                          quantity: dataKeranjang.quantity ?? 5,
                          totalPayment: controller.totalItemRp(index),
                          imgUrl: imgURL,
                          title: dataKeranjang.namaBarang,
                          description:
                              "Harga satuan:\n${dataKeranjang.hargaBarang!.currencyFormatRp}",
                          category: dataKeranjang.jenisBarang ?? "Paket",
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            _bottomMenu(context, controller),
          ],
        ),
      );
    }));
  }

  Container _bottomMenu(BuildContext context, CheckoutController controller) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(27, 0, 0, 0),
              offset: Offset(1, -1),
              blurRadius: 10),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          DropdownButton(
              padding: const EdgeInsets.all(6.0),
              style: context.theme.textTheme.bodyMedium
                  ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
              elevation: 2,
              hint: Text(
                "pilih jenis pembayaran",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              isExpanded: true,
              value: controller.selectedPayment,
              onChanged: (value) {
                controller.onSelectedPayment(value!);
              },
              items: controller.paymentDropDownItems),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Pembayaran",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        controller.totalPayment().currencyFormatRp,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledForegroundColor:
                          AppColors.primaryColor.withOpacity(0.38),
                      disabledBackgroundColor:
                          AppColors.primaryColor.withOpacity(0.12),
                    ),
                    onPressed: controller.isButtonActive.value
                        ? () async {
                            CustomAlertDialog.customAlertDialog(
                                context: context,
                                title: "Konfirmasi",
                                description: "Apakah pesanan sudah sesuai?",
                                onPressYes: () {
                                  controller.purchaseOrder().then((value) {
                                    return _successCheckoutDialog(
                                      context,
                                      controller,
                                    );
                                  });
                                },
                                onPressNo: () {
                                  Get.back();
                                });
                          }
                        : null,
                    child: const Text(
                      "Pesan",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _addressCard(context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Alamat :",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Alamat Pengiriman"),
                          content: SingleChildScrollView(
                            child: FormTextWidget(
                              maxlines: 5,
                              textFormController: controller.alamatController,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primaryColor,
                                side: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "Batal",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.update();
                                Get.back();
                              },
                              child: const Text(
                                "Simpan",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.edit_location_alt,
                    size: 15.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                controller.alamatController.text,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_successCheckoutDialog(
  BuildContext context,
  CheckoutController controller,
) {
  Get.dialog(
      barrierDismissible: true,
      AlertDialog(
        alignment: Alignment.center,
        icon: SvgPicture.asset("assets/images/payment_done.svg")
            .animate()
            .scale(),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        clipBehavior: Clip.antiAlias,
        title: Text(
          controller.messageServer!,
          style: context.theme.textTheme.bodyMedium
              ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ));
  Future.delayed(const Duration(milliseconds: 1500), () {
    controller.redirectHistory();
  });
}
