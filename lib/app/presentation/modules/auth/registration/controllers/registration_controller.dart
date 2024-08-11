// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/app/domain/usecase/auth_usecase.dart';

import '../../login/controller/login_controller.dart';

class RegistrationController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final alamatOutlet = TextEditingController();
  final namaOutlet = TextEditingController();
  final nomorHandphone = TextEditingController().obs;
  final isCheck = false.obs;
  final formKey = GlobalKey<FormState>();
  final visible = true.obs;

  String? selectedOutlet;
  final jenisOutlet = [
    const DropdownMenuItem(value: "Sultan", child: Text("Sultan")),
    const DropdownMenuItem(value: "Regular", child: Text("Regular")),
    const DropdownMenuItem(value: "Silver", child: Text("Silver")),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    Get.find<LoginController>().emailController.clear();
    Get.find<LoginController>().passwordController.clear();
    super.onClose();
  }

  Future onSubmit() async {
    final response = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .register(
      email: emailController.text,
      password: passwordController.text,
      namaOutlet: namaOutlet.text,
      alamatOutlet: alamatOutlet.text,
    );
    response.fold((failure) {
      return Get.snackbar("Gagal", failure.message,
          colorText: Colors.white, backgroundColor: Colors.red[500]);
    }, (message) {
      Get.back();
      return Get.snackbar("Berhasil", message,
          colorText: Colors.white, backgroundColor: Colors.green[500]);
    });
    return response;
  }

  onSelectedOutlet(String outlet) {
    selectedOutlet = outlet;
    update();
    log(outlet);
  }
}
