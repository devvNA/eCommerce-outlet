// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/modules/api_test/detail_api/detail_api_controller.dart';

class DetailApiView extends GetView<DetailApiController> {
  const DetailApiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemesanan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tanggal: ${controller.historyItem!.date}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: ${controller.historyItem!.total}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Status: ${controller.historyItem!.status}'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Produk yang dipesan:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.historyItem!.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.historyItem!.products[index].name),
                subtitle: Text(
                    'Harga: ${controller.historyItem!.products[index].price} - Jumlah: ${controller.historyItem!.products[index].quantity}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
