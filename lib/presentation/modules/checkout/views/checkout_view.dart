// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

import '../../../global/common/custom_alert_dialog.dart';
import '../../../global/common/screen_title.dart';
import '../controllers/checkout_controller.dart';
import 'widgets/checkout_card_widget.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    String imgURL =
        "https://images.tokopedia.net/img/cache/700/VqbcmM/2023/10/10/0e50430c-40e7-4ded-b8ad-23fa364f01f2.png";

    return WillPopScope(
      onWillPop: () {
        return controller.onBack();
      },
      child:
          Scaffold(body: GetBuilder<CheckoutController>(builder: (_) {
        return SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: ScreenTitle(
                  automaticallyImplyLeading: false,
                  title: 'Checkout',
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  width: Get.width,
                  child: RefreshIndicator(
                    color: LightThemeColors.primaryColor,
                    onRefresh: () async {},
                    child: ListView(
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
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        5.verticalSpace,
                        _addressCard(),
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
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        5.verticalSpace,
                        CheckoutProduct(
                          imgUrl: imgURL,
                          title: "Perdana 5GB",
                          description: "Harga satuan:\nRp10.000",
                          category: "Perdana",
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        CheckoutProduct(
                          imgUrl: imgURL,
                          title: "Voucher 10GB",
                          description: "Harga satuan:\nRp10.000",
                          category: "Voucher",
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        CheckoutProduct(
                          imgUrl: imgURL,
                          title: "Voucher 15GB",
                          description: "Harga satuan:\nRp10.000",
                          category: "Voucher",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
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
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                        elevation: 2,
                        hint: Text(
                          "pilih jenis pembayaran",
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                        isExpanded: true,
                        value: controller.selectedPayment,
                        onChanged: (selectedPayment) {
                          controller.onSelectedPayment(selectedPayment!);
                        },
                        items: controller.paymentDropDownItems),
                    SizedBox(
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Pembayaran",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Rp60.000",
                                  style: TextStyle(
                                    fontSize: 14.0,
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
                                disabledForegroundColor: LightThemeColors
                                    .primaryColor
                                    .withOpacity(0.38),
                                disabledBackgroundColor: LightThemeColors
                                    .primaryColor
                                    .withOpacity(0.12),
                              ),
                              onPressed: controller.isButtonActive.value
                                  ? () async {
                                      customAlertDialog(
                                          context: context,
                                          title: "Konfirmasi",
                                          description:
                                              "Apakah pesanan sudah sesuai?",
                                          onPressYes: () {
                                            controller.onTapOrder();
                                            _successCheckoutDialog(context);
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
              ),
            ],
          ),
        );
      })),
    );
  }
}

_addressCard() {
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
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_location_alt,
                  size: 15.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              softWrap: true,
              "216 St Paul's Rd, London N1 2LL, UK Contact :  +44-784232",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void _successCheckoutDialog(BuildContext context) {
  Get.dialog(
      barrierDismissible: false,
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
          'Pemesanan berhasil dilakukan!',
          style: context.theme.textTheme.bodyMedium
              ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ));
}
