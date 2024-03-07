// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/api_test/api_test_controller.dart';

class ApiTestPage extends GetView<ApiTestController> {
  const ApiTestPage({super.key});
  // contoh data history pemesanan produk

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              controller.isVerified(false);
              log(controller.isVerified.toString());
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Name: John Doe'),
              const Text('Email: john.doe@example.com'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('verified:'),
                  !controller.isVerified.value
                      ? const Icon(
                          Icons.do_not_disturb_on,
                          size: 25.0,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.check_circle_rounded,
                          size: 25.0,
                          color: Colors.green,
                        ),
                ],
              ),
              if (!controller.isVerified.value)
                ElevatedButton(
                  child: const Text('Verify'),
                  onPressed: () {
                    // Add verification logic here
                    controller.isAccVerified();
                  },
                ),
            ],
          ),
        );
      }),
    );
  }
}
