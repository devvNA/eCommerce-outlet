// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';
import 'package:marvelindo_outlet/test_widget.dart';

import '../../global/common/skeleton_loading.dart';
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
                "BOOKS",
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
              controller.listBooks.value.isNotEmpty
                  ? Ink(
                      height: Get.height / 1.5,
                      child: RefreshIndicator(
                        color: LightThemeColors.primaryColor,
                        onRefresh: () async {
                          controller.onRefresh();
                        },
                        child: ListView.builder(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount: controller.hasMore
                              ? controller.listBooks.value.length + 1
                              : controller.listBooks.value.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final book = controller.listBooks.value[index];
                            if (index < controller.listBooks.value.length) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_API,
                                        arguments: book);
                                  },
                                  trailing: Text(book.price ?? ""),
                                  title: Text(book.title ?? ""),
                                  subtitle: Text(book.subtitle ?? ""),
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
                  : Center(
                      child: Column(
                        children: [
                          SkeletonLoading(
                            height: Get.height / 1.5,
                          ),
                        ],
                      ),
                    ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightThemeColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainHome()),
                  );
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
