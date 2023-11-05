// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/produk_model.dart';
import 'detail_api_controller.dart';

class DetailApiView extends StatelessWidget {
  DetailApiView({super.key});
  Produk product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail API'),
        centerTitle: true,
      ),
      body: GetBuilder<DetailApiController>(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: Center(
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      // backgroundImage: NetworkImage(controller.book.image!),
                    ),
                    subtitle: Text(
                        "${product.nama}\n${product.id}\n${product.harga.toString()}"),
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
