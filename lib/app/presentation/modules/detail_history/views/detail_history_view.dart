// ignore_for_file: must_be_immutable, unrelated_type_equality_checks
import 'dart:developer';

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/custom_alert_dialog.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

import '../../../../core/utils/helpers/currency/currency.dart';
import '../../../global/theme/my_colors.dart';
import '../controllers/detail_history_controller.dart';

class DetailHistoryView extends GetView<DetailHistoryController> {
  const DetailHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    const txtStyle = TextStyle(
      fontSize: 12.5,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pemesanan Produk'),
      ),
      body: Obx(() {
        return ListView(
          children: [
            8.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnotherStepper(
                stepperList: controller.listSteps,
                stepperDirection: Axis.horizontal,
                activeBarColor: Colors.green,
                inActiveBarColor: Colors.grey,
                activeIndex: controller.listSteps.length - 1,
                barThickness: 1.5,
              ),
            ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Status :',
                          style: txtStyle,
                        ),
                        Text(
                          controller.historiData.status.capitalizeFirst!,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'ID Pesanan :',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "TRS-${controller.historiData.id.toString()}",
                          // '${controller.history.value['id']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          'Tanggal :',
                          style: txtStyle,
                        ),
                        const Spacer(),
                        Text(
                          controller.historiData.tanggal,
                          // '${controller.history.value['tanggal']}',
                          style: txtStyle,
                        ),
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          'Total Pembayaran :',
                          style: txtStyle,
                        ),
                        const Spacer(),
                        Text(
                          controller.historiData.total.currencyFormatRp,
                          style: txtStyle.copyWith(fontSize: 13),
                          // CurrencyFormat.convertToIdr(
                          //     controller.history.value['total']),
                        ),
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          'Jenis Pembayaran :',
                          style: txtStyle,
                        ),
                        const Spacer(),
                        Text(
                          controller.historiData.tipePayment,
                          style: txtStyle,
                        ),
                        // Text(
                        //   controller.history.value["jenis_pembayaran"],
                        //   style: txtStyle,
                        // ),
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        const Text(
                          'Total Barang :',
                          style: txtStyle,
                        ),
                        const Spacer(),
                        Text(
                          '${controller.historiData.detailProduk.length} Barang',
                          style: txtStyle,
                        ),
                        // Text(
                        //   '${controller.history.value['produk'].length} Barang',
                        //   style: txtStyle,
                        // ),
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Alamat :',
                          style: txtStyle,
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          child: Text(
                            "JL. DI Panjaitan No.128, Karangreja, Purwokerto Kidul, Kec. Purwokerto Selatan, Kabupaten Banyumas, Jawa Tengah 53147",
                            style: txtStyle.copyWith(fontSize: 12),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Text(
                        //   '${controller.history.value['produk'].length} Barang',
                        //   style: txtStyle,
                        // ),
                      ],
                    ),
                    attachBox(
                      visible:
                          controller.historiData.tipePayment == "Transfer" &&
                              controller.historiData.status == "proses",
                      context: context,
                      onTap: (controller.uploaded.value)
                          ? () {
                              controller.pickImage();
                            }
                          : null,
                      txtStyle: txtStyle,
                      // visible: controller.history.value["jenis_pembayaran"] ==
                      //     "Transfer",
                    ),
                    3.verticalSpace,
                    Visibility(
                      visible:
                          controller.historiData.tipePayment == "Transfer" &&
                              controller.historiData.status == "proses",
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Ink(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_TRANSFER,
                                  arguments: controller
                                      .historiData.total.currencyFormatRp);
                            },
                            child: Text("Lihat cara pembayaran",
                                style: txtStyle.copyWith(
                                  color: AppColors.blue,
                                )),
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Text(
                      'Pesanan :',
                      style: txtStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      // children: List.generate(
                      //     controller.history.value['produk'].length, (index) {
                      children: List.generate(
                          controller.historiData.detailProduk.length, (index) {
                        final hargaSatuan = int.parse(
                            controller.historiData.detailProduk[index].harga);
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32),
                              ),
                              child: Image.asset(
                                "assets/images/product2.png",
                              ),
                            ),
                          ),
                          // leading: const Icon(Icons.shopping_bag),
                          title: Text(
                            // "Produk ${controller.historiData.detailProduk[index].idProduk}",
                            controller.historiData.detailProduk[index].nama,
                            // controller.history.value['produk'][index]['nama'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            "${CurrencyFormat.convertToIdr(hargaSatuan)} x ${controller.historiData.detailProduk[index].jumlah}",
                            style: txtStyle,
                          ),
                          trailing: Text(
                            CurrencyFormat.convertToIdr(hargaSatuan *
                                controller
                                    .historiData.detailProduk[index].jumlah),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
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
            'Bukti Pembayaran :',
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
                                    color: AppColors.primaryColor,
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
