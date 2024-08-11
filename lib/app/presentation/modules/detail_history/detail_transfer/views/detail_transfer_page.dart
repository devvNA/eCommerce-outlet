import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/modules/about/views/about_app_page.dart';
import 'package:marvelindo_outlet/app/presentation/modules/detail_history/detail_transfer/controllers/detail_transfer_controller.dart';

class DetailTransferView extends GetView<DetailTransferController> {
  const DetailTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pembayaran'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Pembayaran",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        controller.totalBayar,
                        style: const TextStyle(
                            fontSize: 14.0, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bayar Dalam",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(() => Text(
                                controller.remainingTime,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: AppColors.primaryColor),
                              )),
                          2.verticalSpace,
                          Obx(() => Text(
                                "Jatuh tempo ${controller.formattedDueDate}",
                                style: const TextStyle(
                                    fontSize: 11.0, color: AppColors.gray),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 10.0,
              color: const Color(0xFFEFEFEF),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvvL6lKkQBCkCpaum8J1SW812Rt_RCKFZiEw&s",
                        height: 45.0,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Bank Mandiri"),
                            5.verticalSpace,
                            const Divider(color: Colors.grey),
                            3.verticalSpace,
                            const Text(
                              "No Rek/Virtual Account ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "896 XXXX XXXX XXXX",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Salin",
                                    style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: Colors.grey),
                            2.verticalSpace,
                            const Text(
                              "Proses verifikasi kurang dari 15 menit upload pembayaran",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 10.0,
              color: const Color(0xFFEFEFEF),
            ),
            const ExpansionFeatures(
              title: "Petunjuk Transfer",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas malesuada lacus eget lorem lobortis, sit amet blandit nibh efficitur. Sed eget finibus risus, varius pellentesque nibh. Donec ut purus non dolor pulvinar fermentum. Aenean tempus neque nunc, id mattis felis vulputate in. Mauris interdum placerat felis nec varius. Aliquam id maximus tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent luctus, enim id sagittis tincidunt, lacus nisl viverra nibh, at placerat nibh libero vitae leo.\nNulla fermentum ultricies tincidunt. Curabitur cursus mi tincidunt ante tristique, sed fermentum leo porta. Nullam convallis odio sit amet faucibus rutrum. In hac habitasse platea dictumst. Proin dignissim turpis a est finibus tempus. Suspendisse eleifend felis nec varius elementum. Aenean nec ultricies felis. Nullam ornare leo non dignissim malesuada. Vivamus et libero eget odio malesuada pharetra nec in dolor. Curabitur dapibus lacinia lectus, vel condimentum tellus volutpat id.",
            )
          ],
        ),
      ),
    );
  }
}
