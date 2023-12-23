import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/global/widgets/loading_custom_widget.dart';

import '../../../global/widgets/screen_title.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color(0xffF3F5F9),
    //   body: Obx(() {
    //     return Padding(
    //       padding: EdgeInsets.all(26.0),
    //       child: Column(
    //         children: [
    //           Spacer(),
    //           20.verticalSpace,
    //           ScreenTitle(
    //             centerTitle: true,
    //             title: 'Profil',
    //             dividerEndIndent: 230,
    //           ),
    //           10.verticalSpace,
    //           Column(
    //             children: [
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(bottom: 8.0),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(124 / 2),
    //                   color: Colors.white,
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.08),
    //                         blurRadius: 24,
    //                         offset: Offset(0, 8),
    //                         spreadRadius: 8)
    //                   ],
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.all(5.0),
    //                   child: CircleAvatar(
    //                     radius: 30.0,
    //                     backgroundImage: NetworkImage(
    //                       "${controller.getDisplayProfile()}",
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 "${controller.getUsername()}",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 3.0,
    //               ),
    //               Text(
    //                 "${controller.getEmail()}",
    //                 style: TextStyle(
    //                   fontSize: 12,
    //                   color: Colors.grey[650],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10.0,
    //               ),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   controller.onTapGetAccessToken();
    //                 },
    //                 child: Text("AccessToken"),
    //               ),
    //               10.verticalSpace,
    //               controller.accessToken.value.isEmpty
    //                   ? Center(
    //                       child: SizedBox(
    //                           width: 20,
    //                           height: 20,
    //                           child: LoadingCustomWidget()))
    //                   : SizedBox(
    //                       height: 100,
    //                       child: ListView(
    //                         children: [
    //                           Text(controller.accessToken.value),
    //                         ],
    //                       )),
    //               10.verticalSpace,
    //               Divider(thickness: 1),
    //               // Row(
    //               //   mainAxisAlignment: MainAxisAlignment.center,
    //               //   children: [
    //               //     Card(
    //               //       color: Color(0xff34C759),
    //               //       child: Padding(
    //               //         padding: EdgeInsets.only(
    //               //           left: 12.0,
    //               //           right: 12.0,
    //               //           top: 4.0,
    //               //           bottom: 4.0,
    //               //         ),
    //               //         child: Text(
    //               //           "Lorem: ",
    //               //           style: TextStyle(
    //               //             color: Colors.white,
    //               //             fontSize: 12.0,
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //     SizedBox(
    //               //       width: 4,
    //               //     ),
    //               //     Card(
    //               //       color: Color(0xffAF52DE),
    //               //       child: Padding(
    //               //         padding: EdgeInsets.only(
    //               //           left: 12.0,
    //               //           right: 12.0,
    //               //           top: 4.0,
    //               //           bottom: 4.0,
    //               //         ),
    //               //         child: Text(
    //               //           "Lorem: ",
    //               //           style: TextStyle(
    //               //             color: Colors.white,
    //               //             fontSize: 12.0,
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ],
    //               // ),
    //               // Divider(
    //               //   thickness: 1,
    //               // ),
    //               SizedBox(
    //                 height: 10.0,
    //               ),
    //               SizedBox(
    //                 height: 16,
    //               ),
    //             ],
    //           ),
    //           Spacer(),
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Expanded(
    //                       child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(12),
    //                           ),
    //                         ),
    //                         onPressed: () {
    //                           Get.back();
    //                         },
    //                         child: Text("Kembali"),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   }),
    // );

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Profil"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: Get.width,
              color: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("${controller.getDisplayProfile()}"),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          "${controller.getUsername()}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${controller.getEmail()}",
                          style: const TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.edit,
                        size: 12.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20.0,
                right: 20.0,
                bottom: 0.0,
              ),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            Text(
                              "13K",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "lorem ipsum",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            Text(
                              "2K",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "lorem ipsum",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.post_add),
                            Text(
                              "2K",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "lorem ipsum",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) {
                  List items = [
                    {
                      "label": "Addresses",
                      "icon": Icons.pin_drop,
                      "on_tap": () {}
                    },
                    {
                      "label": "Referral code",
                      "icon": Icons.code,
                      "on_tap": () {}
                    },
                    {"label": "TOS", "icon": Icons.warning, "on_tap": () {}}
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = items[index];
                          return InkWell(
                            onTap: () {
                              if (item["on_tap"] != null) {
                                item["on_tap"]!();
                              }
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  leading: Icon(
                                    item["icon"],
                                    size: 30.0,
                                  ),
                                  title: Text(item["label"]),
                                  trailing: const Icon(
                                    Icons.chevron_right,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
