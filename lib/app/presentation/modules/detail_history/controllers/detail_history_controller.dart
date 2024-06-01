// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:path/path.dart' as path;

import '../../../../data/models/histori_pemesanan_model.dart';

class DetailHistoryController extends GetxController {
  final currentStep = 0.obs;
  final listSteps = <StepperData>[].obs;
  final fileName = ''.obs;
  final imageFile = Rx<File?>(null);
  final uploaded = true.obs;
  HistoriPemesanan historiData = Get.arguments;

  // File? get imageFile => _imageFile.value;
  // String get fileName => _fileName.value;

  // contoh data dummy history pemesanan produk
  final history = Rx<Map<String, dynamic>>({
    'id': 'H001',
    'tanggal': DateFormat('dd/MM/yyyy, HH:mm:ss').format(DateTime.now()),
    'total': 2542000,
    // 'jenis_pembayaran': "COD",
    'jenis_pembayaran': "Transfer",
    'status': 'Selesai',
    'produk': [
      {'nama': 'Perdana Unlimited', 'harga': 10000, 'jumlah': 5},
      {'nama': 'Voucher 5GB', 'harga': 50000, 'jumlah': 1},
      {'nama': 'Perdana Unlimited FUP-3', 'harga': 50000, 'jumlah': 100},
      {'nama': 'Perdana Unlimited FUP-1', 'harga': 20000, 'jumlah': 50},
      {'nama': 'Smart Ceria 50GB', 'harga': 12000, 'jumlah': 3},
      {'nama': 'Smart Ceria 50GB', 'harga': 12000, 'jumlah': 3},
      {'nama': 'Smart Ceria 50GB', 'harga': 12000, 'jumlah': 3},
    ]
  });

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  void onInit() {
    super.onInit();
    fetchStepData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      fileName.value = path.basename(pickedFile.path);
    }
  }

  Future fetchStepData() async {
    final response =
        await rootBundle.loadString("assets/dummy_json/dummy_step.json");
    final responseDecode = json.decode(response);

    // Buat daftar Step berdasarkan data yang diterima dari API
    for (var data in responseDecode['data']) {
      log(data.toString());
      listSteps.add(
        StepperData(
          title: StepperText(
            data['title'],
            textStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
          iconWidget: CircleAvatar(
            backgroundColor:
                data["status"] == "completed" ? AppColors.green1 : Colors.grey,
            child: data["status"] == "completed"
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : null,
          ),
        ),
      );
    }

    return listSteps;
  }

  onRefreshHistory() {
    history().clear();
  }
}
