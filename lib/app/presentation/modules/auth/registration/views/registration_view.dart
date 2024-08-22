// ignore_for_file: must_be_immutable, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/validator.dart';

import '../../../../global/theme/my_colors.dart';
import '../controllers/registration_controller.dart';
import 'widgets/form_registration_widget.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Daftar"),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Obx(() {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildEmailField(),
              const SizedBox(height: 12.0),
              _buildPasswordField(),
              const SizedBox(height: 12.0),
              _buildOutletNameField(),
              const SizedBox(height: 12.0),
              _buildSerialNumberField(),
              const SizedBox(height: 12.0),
              _buildAddressField(),
              const SizedBox(height: 12.0),
              _buildTermsAndConditions(),
              const SizedBox(height: 12.0),
              _buildRegisterButton()
            ],
          ),
        ),
      );
    });
  }

  Widget _buildEmailField() {
    return FormRegistrationWidget(
      formTitle: 'Email',
      formController: controller.emailController,
      validator: Validator.email,
    );
  }

  Widget _buildPasswordField() {
    return FormRegistrationWidget(
      obscureText: controller.visible.value,
      formTitle: 'Password',
      hintText: "********",
      formController: controller.passwordController,
      validator: _passwordValidator,
      suffixIcon: _buildPasswordVisibilityToggle(),
    );
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Masukkan password";
    } else if (value.length < 6) {
      return "Kata sandi harus 6 karakter atau lebih";
    }
    return null;
  }

  Widget _buildPasswordVisibilityToggle() {
    return IconButton(
      onPressed: () => controller.visible.toggle(),
      icon: Icon(
        controller.visible.value
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        size: 20.0,
      ),
    );
  }

  Widget _buildOutletNameField() {
    return FormRegistrationWidget(
      formTitle: 'Nama Outlet',
      formController: controller.namaOutlet,
      validator: Validator.required,
    );
  }

  Widget _buildSerialNumberField() {
    return ReusableFormWidget(
      formTitle: "Kode Serial",
      controller: controller.serialNumber,
      hintText: '[optional]',
    );
  }

  Widget _buildAddressField() {
    return FormAddressWidget(
      formTitle: "Alamat Outlet",
      formController: controller.alamatOutlet,
      validator: Validator.required,
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        Obx(() => Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              activeColor: AppColors.primaryColor,
              value: controller.isCheck.value,
              onChanged: (value) => controller.isCheck(value),
            )),
        Expanded(
          child: GestureDetector(
            onTap: () => controller.isCheck.toggle(),
            child: const Text(
              "Saya menyetujui Syarat dan Ketentuan serta Kebijakan Privasi MV Shop",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: Obx(() => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: controller.isCheck.value ? _onRegisterPressed : null,
            child: const Text(
              "Daftar",
              style: TextStyle(fontSize: 14),
            ),
          )),
    );
  }

  void _onRegisterPressed() {
    if (controller.formKey.currentState!.validate()) {
      controller.onSubmit();
    } else {
      log("Registrasi gagal");
    }
  }
}
