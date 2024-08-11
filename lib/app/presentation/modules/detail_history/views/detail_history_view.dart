// ignore_for_file: must_be_immutable, unrelated_type_equality_checks
import 'dart:developer';

import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/custom_alert_dialog.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

import '../../../../core/utils/helpers/currency/currency.dart';
import '../../../global/theme/my_colors.dart';
import '../controllers/detail_history_controller.dart';

class DetailHistoryView extends GetView<DetailHistoryController> {
  const DetailHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pemesanan Produk'),
        elevation: 0, // Menghilangkan bayangan pada AppBar
      ),
      body: Obx(() {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            _buildStepper(),
            SizedBox(height: 16.h),
            _buildOrderDetails(context),
            SizedBox(height: 16.h),
            _buildOrderItems(),
          ],
        );
      }),
    );
  }

  Widget _buildStepper() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: AnotherStepper(
          stepperList: controller.listSteps,
          stepperDirection: Axis.horizontal,
          activeBarColor: Colors.green,
          inActiveBarColor: Colors.grey,
          activeIndex: controller.listSteps.length - 1,
          barThickness: 1.5,
        ),
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('ID Pesanan', "TRS-${controller.historiData.id}",
                isBold: true),
            _buildDetailRow('Tanggal', controller.historiData.tanggal),
            _buildDetailRow('Total Pembayaran',
                controller.historiData.total.currencyFormatRp),
            _buildDetailRow(
                'Jenis Pembayaran', controller.historiData.tipePayment),
            _buildDetailRow('Total Barang',
                '${controller.historiData.detailProduk.length} Barang'),
            _buildDetailRow('Alamat', controller.outlet!.alamat, maxLines: 2),
            if (controller.historiData.tipePayment == "Transfer")
              attachBox(
                context: context,
                onTap: controller.uploaded.value
                    ? () => controller.pickImage()
                    : null,
                txtStyle: TextStyle(fontSize: 12.sp),
                visible: true,
              ),
            2.verticalSpace,
            if (controller.historiData.tipePayment == "Transfer")
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.DETAIL_TRANSFER,
                        arguments:
                            controller.historiData.total.currencyFormatRp);
                  },
                  child: const Text(
                    "Lihat cara pembayaran",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool isBold = false, int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItems() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesanan:',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            ...controller.historiData.detailProduk
                .map((item) => _buildOrderItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(DetailProduk item) {
    final hargaSatuan = int.parse(item.harga);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/product2.png"),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.nama,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${CurrencyFormat.convertToIdr(hargaSatuan)} x ${item.jumlah}",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            CurrencyFormat.convertToIdr(hargaSatuan * item.jumlah),
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Visibility attachBox({
    required TextStyle txtStyle,
    required bool visible,
    required void Function()? onTap,
    required BuildContext context,
  }) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          2.verticalSpace,
          Text(
            'Bukti :',
            style: txtStyle,
          ),
          3.verticalSpace,
          Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
              border: Border.all(
                color: AppColors.lightGrey,
              ),
            ),
            child: Row(
              children: [
                Ink(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      color: AppColors.primaryColor),
                  child: InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: EdgeInsets.all(
                          (controller.imageFile.value == null) ? 11 : 12),
                      child: (controller.imageFile.value == null)
                          ? const Text(
                              "Pilih File",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            )
                          : Text(
                              (controller.uploaded.value)
                                  ? "Ganti File"
                                  : "Diunggah",
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                    ),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: (controller.imageFile.value == null)
                      ? const Text(
                          "Tidak ada file yang dipilih",
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 12.0, color: AppColors.gray),
                        )
                      : Text(
                          controller.fileName.value,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: AppColors.gray,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.05),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        (controller.imageFile.value == null) ? 12 : 8),
                    child: (controller.imageFile.value == null)
                        ? const Text(
                            ".jpg .png",
                            style: TextStyle(
                                fontSize: 12.0, color: AppColors.gray),
                          )
                        : InkWell(
                            onTap: (controller.uploaded.value)
                                ? () {
                                    CustomAlertDialog.customAlertDialog(
                                      no: "Batal",
                                      yes: "Unggah",
                                      context: context,
                                      title: "Konfirmasi",
                                      description: "Upload bukti transfer?",
                                      onPressYes: () {
                                        controller.uploaded.value =
                                            !controller.uploaded.value;
                                        log(controller.uploaded.value
                                            .toString());
                                        Get.back();
                                      },
                                      onPressNo: () {
                                        Get.back();
                                      },
                                    );
                                  }
                                : null,
                            child: (controller.uploaded.value)
                                ? const Icon(
                                    Icons.upload,
                                    color: AppColors.gray,
                                  )
                                : const Icon(
                                    Icons.check_circle,
                                    color: AppColors.blue,
                                  )),
                  ),
                ),
              ],
            ),
          ),
          5.verticalSpace,
        ],
      ),
    );
  }
}
