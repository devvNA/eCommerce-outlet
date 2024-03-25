import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final alamat = TextEditingController().obs;
  final nama = TextEditingController().obs;
  final nomorHandphone = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

  void onSubmit() {
    Get.back();
  }
}
