// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notifikasi_controller.dart';
import 'widgets/notifikasi_item_widget.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              5,
              (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: NotificationItem(),
                  )),
        ),
      ),
    );
  }
}
