// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/core/utils/helpers/currency.dart';
import 'package:marvelindo_outlet/presentation/modules/detail_history/controllers/detail_history_controller.dart';

class DetailHistoryView extends GetView<DetailHistoryController> {
  const DetailHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pemesanan Produk'),
      ),
      body: Obx(() {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.all(14),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'ID:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${controller.history.value['id']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Tanggal:'),
                    const Spacer(),
                    Text('${controller.history.value['tanggal']}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Total:'),
                    const Spacer(),
                    Text(CurrencyFormat.convertToIdr(
                        controller.history.value['total']))
                  ],
                ),
                Row(
                  children: [
                    const Text('Status:'),
                    const Spacer(),
                    Text('${controller.history.value['status']}'),
                  ],
                ),
                const Text('Produk:'),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.history.value['produk'].length,
                    itemBuilder: (context, idx) {
                      return ListTile(
                        leading: const Icon(Icons.shopping_bag),
                        title: Text(
                            controller.history.value['produk'][idx]['nama']),
                        subtitle: Text(
                            '${CurrencyFormat.convertToIdr(controller.history.value['produk'][idx]['harga'])} x ${controller.history.value['produk'][idx]['jumlah']}'),
                        trailing: Text(
                            ' ${CurrencyFormat.convertToIdr(controller.history.value['produk'][idx]['harga'] * controller.history.value['produk'][idx]['jumlah'])}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
