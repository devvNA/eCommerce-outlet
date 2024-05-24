import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/theme/my_colors.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Obx(() {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: AppColors.gradientBG,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: AppColors.primaryColor,
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Profil",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        "assets/icons/mv-logo.png",
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Hero(
                    tag: "profile",
                    child: CircleAvatar(
                      radius: 36.0,
                      backgroundImage:
                          NetworkImage("${controller.getDisplayProfile()}"),
                    ),
                  ),
                  8.verticalSpace,
                  controller.isVerified()
                      ? InkWell(
                          onTap: () {
                            // controller.isVerifiedTap();
                          },
                          child: const Chip(
                              backgroundColor: Colors.green,
                              label: Text(
                                "Terverifikasi",
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              )),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            backgroundColor: AppColors.gray,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          onPressed: () {
                            controller.isVerifiedTap();
                          },
                          child: const Text(
                            "Belum terverifikasi",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            10.verticalSpace,
            Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Identitas Diri",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.EDIT_PROFIL);
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Nama Lengkap",
                            style: TextStyle(
                                fontSize: 12.0, color: AppColors.gray),
                          ),
                          Text(
                            Get.find<ProfilController>().getUsername()!,
                            style: const TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          8.verticalSpace,
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 12.0, color: AppColors.gray),
                          ),
                          Text(
                            Get.find<ProfilController>().getEmail()!,
                            style: const TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          8.verticalSpace,
                          const Text(
                            "Nama Outlet",
                            style: TextStyle(
                                fontSize: 12.0, color: AppColors.gray),
                          ),
                          const Text(
                            "Dev Cell",
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          8.verticalSpace,
                          const Text(
                            "Jenis Outlet",
                            style: TextStyle(
                                fontSize: 12.0, color: AppColors.gray),
                          ),
                          const Text(
                            "Sultan",
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          8.verticalSpace,
                          const Text(
                            "Alamat",
                            style: TextStyle(
                                fontSize: 12.0, color: AppColors.gray),
                          ),
                          const Text(
                            "JL Gatot Subroto, No. 40 Tambaksari, Sidanegara, Kecamatan Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah ",
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        );
      }),
    );
  }
}
