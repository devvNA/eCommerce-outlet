// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/modules/api_test/api_test_controller.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

class ApiTestPage extends GetView<ApiTestController> {
  ApiTestPage({super.key});

  final List<HistoryItem> history = [
    HistoryItem(
      id: 1,
      date: '25 Maret 2024',
      total: 150000,
      status: 'Selesai',
      products: [
        ProductItem(name: 'Nasi Goreng', price: 25000, quantity: 2),
        ProductItem(name: 'Ayam Goreng', price: 35000, quantity: 1),
      ],
    ),
    HistoryItem(
      id: 2,
      date: '20 Maret 2024',
      total: 75000,
      status: 'Selesai',
      products: [
        ProductItem(name: 'Es Teh Manis', price: 10000, quantity: 3),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori Pemesanan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final data = history[index];
                return ListTile(
                  title: Text('Pemesanan ke-${data.id}'),
                  subtitle:
                      Text('Total: ${data.total} - Status: ${data.status}'),
                  onTap: () {
                    Get.toNamed(Routes.DETAIL_API, arguments: data);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryItem {
  final int id;
  final String date;
  final int total;
  final String status;
  final List<ProductItem> products;

  HistoryItem(
      {required this.id,
      required this.date,
      required this.total,
      required this.status,
      required this.products});
}

class ProductItem {
  final String name;
  final int price;
  final int quantity;

  ProductItem(
      {required this.name, required this.price, required this.quantity});
}
