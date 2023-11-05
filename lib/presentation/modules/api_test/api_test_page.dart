// ignore_for_file: override_on_non_overriding_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_test_controller.dart';

class ApiTestPage extends GetView<ApiTestController> {
  const ApiTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiTestController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('API Test'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: GetBuilder<ApiTestController>(
                    builder: (_) {
                      if (controller.loading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (controller.listBooks.value.isEmpty) {
                        return const Center(
                            child: Text("Produk tidak ditemukan"));
                      }
                      return GridView.builder(
                        padding: const EdgeInsets.only(top: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.72,
                        ),
                        itemCount: controller.listBooks.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          final book = controller.listBooks.value[index];
                          return Card(
                            elevation: 0.0,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(book.image ??
                                            "https://i.ibb.co/S32HNjD/no-image.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.title ?? "",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              book.subtitle ?? "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "Stok : ${book.price.toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      // return _buildProductsList();
                    },
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
