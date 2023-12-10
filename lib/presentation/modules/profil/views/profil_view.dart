import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/widgets/loading_custom_widget.dart';

import '../../../global/widgets/screen_title.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F9),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              const Spacer(),
              20.verticalSpace,
              const ScreenTitle(
                centerTitle: true,
                title: 'Profil',
                dividerEndIndent: 230,
              ),
              10.verticalSpace,
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(124 / 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                            spreadRadius: 8)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          "${controller.getDisplayProfile()}",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${controller.getUsername()}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    "${controller.getEmail()}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[650],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.onTapGetAccessToken();
                    },
                    child: const Text("AccessToken"),
                  ),
                  10.verticalSpace,
                  controller.accessToken.value.isEmpty
                      ? const Center(
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: LoadingCustomWidget()))
                      : SizedBox(
                          height: 100,
                          child: ListView(
                            children: [
                              Text(controller.accessToken.value),
                            ],
                          )),
                  10.verticalSpace,
                  const Divider(thickness: 1),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Card(
                  //       color: Color(0xff34C759),
                  //       child: Padding(
                  //         padding: EdgeInsets.only(
                  //           left: 12.0,
                  //           right: 12.0,
                  //           top: 4.0,
                  //           bottom: 4.0,
                  //         ),
                  //         child: Text(
                  //           "Lorem: ",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 12.0,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     ),
                  //     Card(
                  //       color: Color(0xffAF52DE),
                  //       child: Padding(
                  //         padding: EdgeInsets.only(
                  //           left: 12.0,
                  //           right: 12.0,
                  //           top: 4.0,
                  //           bottom: 4.0,
                  //         ),
                  //         child: Text(
                  //           "Lorem: ",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 12.0,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Divider(
                  //   thickness: 1,
                  // ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              const Spacer(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Kembali"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
