import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_history_controller.dart';

class DetailHistoryView extends GetView<DetailHistoryController> {
  const DetailHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
