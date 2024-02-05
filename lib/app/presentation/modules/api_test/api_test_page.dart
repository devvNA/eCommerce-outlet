// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/modules/api_test/api_test_controller.dart';

class ApiTestPage extends GetView<ApiTestController> {
  ApiTestPage({super.key});
  // contoh data history pemesanan produk
  List<Map<String, dynamic>> history = [
    {
      'id': 'H001',
      'tanggal': '01/02/2024',
      'total': 150000,
      'status': 'Selesai',
      'produk': [
        {'nama': 'Sepatu', 'harga': 100000, 'jumlah': 1},
        {'nama': 'Kaos', 'harga': 50000, 'jumlah': 1},
      ]
    },
    {
      'id': 'H002',
      'tanggal': '02/02/2024',
      'total': 200000,
      'status': 'Dikirim',
      'produk': [
        {'nama': 'Tas', 'harga': 150000, 'jumlah': 1},
        {'nama': 'Topi', 'harga': 50000, 'jumlah': 1},
      ]
    },
    {
      'id': 'H003',
      'tanggal': '03/02/2024',
      'total': 250000,
      'status': 'Dibatalkan',
      'produk': [
        {'nama': 'Jaket', 'harga': 200000, 'jumlah': 1},
        {'nama': 'Celana', 'harga': 50000, 'jumlah': 1},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Pemesanan Produk'),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${history[index]['id']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Tanggal: ${history[index]['tanggal']}'),
                  Text('Total: Rp ${history[index]['total']}'),
                  Text('Status: ${history[index]['status']}'),
                  const Text('Produk:'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: history[index]['produk'].length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: const Icon(Icons.shopping_bag),
                        title: Text(history[index]['produk'][i]['nama']),
                        subtitle: Text(
                            'Rp ${history[index]['produk'][i]['harga']} x ${history[index]['produk'][i]['jumlah']}'),
                        trailing: Text(
                            'Rp ${history[index]['produk'][i]['harga'] * history[index]['produk'][i]['jumlah']}'),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
