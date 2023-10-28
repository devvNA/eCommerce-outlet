import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_api_controller.dart';

class DetailApiView extends GetView<DetailApiController> {
  const DetailApiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail API'),
        centerTitle: true,
      ),
      body: GetBuilder<DetailApiController>(builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: Center(
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(controller.book.image!),
                    ),
                    title: Text(controller.book.title!),
                    subtitle: Text(
                        "${controller.book.subtitle!}\n${controller.book.price!}\n${controller.book.isbn13!}\n${controller.book.url!}"),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
