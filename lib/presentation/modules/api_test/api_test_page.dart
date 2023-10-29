// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

import 'api_test_controller.dart';

class ApiTestPage extends GetView<ApiTestController> {
  const ApiTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Test'),
        centerTitle: true,
      ),
      body: GetBuilder<ApiTestController>(
        builder: (controller) {
          return ListView(
            padding: const EdgeInsets.all(18),
            children: [
              const Text(
                "Products",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 4.0,
              ),
              controller.listProducts.value.isNotEmpty
                  ? Ink(
                      height: Get.height / 2,
                      child: RefreshIndicator(
                        color: LightThemeColors.primaryColor,
                        onRefresh: () async {
                          controller.onRefresh();
                        },
                        child: ListView.builder(
                          controller: controller.scrollController,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          itemCount: controller.listProducts.value.length,
                          // controller.hasMore
                          //     ? controller.listProducts.value.length + 1
                          //     : controller.listProducts.value.length,
                          itemBuilder: (context, index) {
                            final product =
                                controller.listProducts.value[index];
                            if (index < controller.listProducts.value.length) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_API,
                                        arguments: product);
                                  },
                                  trailing: Text(product.id.toString()),
                                  title: Text(product.nama!),
                                  subtitle: Text(product.harga.toString()),
                                ),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  : SizedBox(
                      height: Get.height / 2,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
              // Center(
              //     child: Column(
              //       children: [
              //         SkeletonLoading(
              //           height: Get.height / 2,
              //         ),
              //       ],
              //     ),
              //   ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightThemeColors.primaryColor,
                ),
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MainHome()),
                  // );
                  await Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text("Widget Test"),
              ),
            ],
          );
        },
      ),
    );
  }
}
