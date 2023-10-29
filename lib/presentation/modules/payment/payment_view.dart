import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/common/screen_title.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

import '../base/controllers/base_controller.dart';
import 'payment_controller.dart';

class PaymentCategory {
  final String title;
  bool isSelected;
  PaymentCategory(this.title, this.isSelected);
}

List<PaymentCategory> categoryList = [
  PaymentCategory("COD", false),
  PaymentCategory("Transfer", false),
];

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PaymentController>(
        initState: (_) {},
        builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: ScreenTitle(title: "Checkout"),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rp 60.000",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Payment",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "COD",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Transfer",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Visibility(
                          visible: true,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bukti Transfer",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  child: Card(
                                    child: ListTile(
                                      title: const Text("Upload"),
                                      trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.upload_rounded,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.symmetric(
                                //       horizontal: 24),
                                //   height: 60.0,
                                //   decoration: BoxDecoration(
                                //     color: Colors.grey[200],
                                //     borderRadius: BorderRadius.all(
                                //       Radius.circular(
                                //         8.0,
                                //       ),
                                //     ),
                                //   ),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         "Upload",
                                //         style: TextStyle(
                                //           fontSize: 14.0,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //       IconButton(
                                //         highlightColor:
                                //             LightThemeColors.primaryColor,
                                //         autofocus: true,
                                //         color: LightThemeColors.primaryColor,
                                //         onPressed: () {},
                                //         icon: Icon(
                                //           Icons.upload_rounded,
                                //           size: 24.0,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 75,
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LightThemeColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      Get.dialog(
                          barrierDismissible: false,
                          AlertDialog(
                            alignment: Alignment.center,
                            icon: SvgPicture.asset(
                                    "assets/images/payment_done.svg")
                                .animate()
                                .scale(),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            title: Text(
                              'Transaksi berhasil dilakukan!',
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                            ),
                          ));
                      await Future.delayed(const Duration(milliseconds: 1500))
                          .then((value) => Get.back());
                      Get.find<BaseController>().changeScreen(2);
                      Get.offNamed(Routes.BASE);
                    },
                    child: const Text("Pesan"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
