// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/app/presentation/modules/api_test/api_test_page.dart';

class DetailApiView extends StatelessWidget {
  final HistoryItem? historyItem;

  const DetailApiView({
    super.key,
    this.historyItem,
  });

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
            child: Text('Tanggal: ${historyItem!.date}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: ${historyItem!.total}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Status: ${historyItem!.status}'),
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
            itemCount: historyItem!.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(historyItem!.products[index].name),
                subtitle: Text(
                    'Harga: ${historyItem!.products[index].price} - Jumlah: ${historyItem!.products[index].quantity}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
