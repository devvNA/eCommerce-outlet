// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/modules/detail_history/detail_history_controller.dart';

class DetailHistoryView extends GetView<DetailHistoryController> {
  const DetailHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pemesanan Produk'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.history.value.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: ${controller.history.value[index]['id']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Tanggal: ${controller.history.value[index]['tanggal']}'),
                    Text(
                        'Total: Rp ${controller.history.value[index]['total']}'),
                    Text(
                        'Status: ${controller.history.value[index]['status']}'),
                    const Text('Produk:'),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.history.value[index]['produk'].length,
                      itemBuilder: (context, idx) {
                        return ListTile(
                          leading: const Icon(Icons.shopping_bag),
                          title: Text(controller.history.value[index]['produk']
                              [idx]['nama']),
                          subtitle: Text(
                              'Rp ${controller.history.value[index]['produk'][idx]['harga']} x ${controller.history.value[index]['produk'][idx]['jumlah']}'),
                          trailing: Text(
                              'Rp ${controller.history.value[index]['produk'][idx]['harga'] * controller.history.value[index]['produk'][idx]['jumlah']}'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
