// ignore_for_file: must_be_immutable, unrelated_type_equality_checks
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/data/models/histori_pemesanan_model.dart';

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
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                children: [
                  _buildOrderDetails(context),
                  SizedBox(height: 8.h),
                  _buildPaymentAttachmentWidget(),
                  SizedBox(height: 8.h),
                  _buildOrderItems(),
                ],
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          );
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          children: [
            _buildOrderDetails(context),
            SizedBox(height: 8.h),
            _buildOrderItems(),
            SizedBox(height: 8.h),
            _buildPaymentAttachmentWidget(),
            SizedBox(height: 8.h),
            _buildEvidenceWidget(),
          ],
        );
      }),
    );
  }

  Visibility _buildEvidenceWidget() {
    return Visibility(
      visible: controller.historiData.status == "selesai",
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bukti Diterima:',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Obx(() {
                if (controller.imageFile.value != null ||
                    controller.historiData.urlBukti != null) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: controller.historiData.urlBukti != null &&
                                controller.imageFile.value == null
                            ? Image.network(
                                controller.historiData.urlBukti,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.error,
                                              color: Colors.red),
                                          4.verticalSpace,
                                          const Text(
                                            "Gagal memuat gambar",
                                            style: TextStyle(
                                              fontSize: 8.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Image.file(
                                File(controller.imageFile.value!.path),
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
                  );
                }
              }),
              8.verticalSpace,
              Visibility(
                visible: controller.historiData.status != "dibatalkan" &&
                    controller.historiData.status != "selesai",
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.pickImage();
                    if (controller.imageFile.value != null) {
                      await controller.uploadBukti();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      controller.imageFile.value != null
                          ? 'Perbarui Bukti Pembayaran'
                          : 'Unggah Bukti Pembayaran',
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildStepper() {
  //   return Card(
  //     elevation: 2,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     child: Padding(
  //       padding: EdgeInsets.all(16.w),
  //       child: AnotherStepper(
  //         stepperList: controller.listSteps,
  //         stepperDirection: Axis.horizontal,
  //         activeBarColor: Colors.green,
  //         inActiveBarColor: Colors.grey,
  //         activeIndex: controller.listSteps.length,
  //         barThickness: 1.5,
  //       ),
  //     ),
  //   );
  // }

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
              child: Text(
                item.nama.substring(0, 1),
                style: TextStyle(fontSize: 12.sp),
              ),
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

  Widget _buildPaymentAttachmentWidget() {
    return Visibility(
      visible: controller.historiData.tipePayment == "Transfer" &&
          controller.historiData.status == "selesai",
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bukti Pembayaran:',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Obx(() {
                if (controller.imageFile.value != null ||
                    controller.historiData.urlBukti != null) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: controller.historiData.urlBukti != null &&
                                controller.imageFile.value == null
                            ? Image.network(
                                controller.historiData.urlBukti,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.error,
                                              color: Colors.red),
                                          4.verticalSpace,
                                          const Text(
                                            "Gagal memuat gambar",
                                            style: TextStyle(
                                              fontSize: 8.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Image.file(
                                File(controller.imageFile.value!.path),
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
                  );
                }
              }),
              8.verticalSpace,
              Visibility(
                visible: controller.historiData.status != "dibatalkan" &&
                    controller.historiData.status != "selesai",
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.pickImage();
                    if (controller.imageFile.value != null) {
                      await controller.uploadBukti();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      controller.imageFile.value != null
                          ? 'Perbarui Bukti Pembayaran'
                          : 'Unggah Bukti Pembayaran',
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
