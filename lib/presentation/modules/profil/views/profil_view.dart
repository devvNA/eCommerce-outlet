import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/theme/my_colors.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Obx(() {
        return SingleChildScrollView(
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
                      onTap: () {
                        controller.isVerified.value = !controller.isVerified();
                        log(controller.isVerified.toString());
                      },
                      child: CircleAvatar(
                        radius: 13.0,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          controller.isVerified()
                              ? Icons.check_circle_sharp
                              : Icons.do_not_disturb_on,
                          size: 25.0,
                          color: controller.isVerified()
                              ? Colors.green
                              : Colors.red,
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
                        "on_tap": () {
                          controller.isVerifiedTap();
                        }
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
        );
      }),
    );
  }
}
