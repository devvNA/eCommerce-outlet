// ignore_for_file: must_be_immutable, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Column(
        children: [
          _headerAppbar(context),
          Expanded(
            child: _bodyContains(context),
          ),
        ],
      ),
    );
  }

  Widget _bodyContains(BuildContext context) {
    RegistrationController controller = Get.find();
    return Obx(() {
      return Form(
        key: controller.formKey,
        child: SizedBox(
          child: ListView(
            shrinkWrap: true,
            clipBehavior: Clip.antiAlias,
            padding:
                const EdgeInsets.only(top: 12, left: 22, right: 22, bottom: 12),
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            children: [
              const SizedBox(
                height: 15.0,
              ),
              FormRegistrationWidget(
                formTitle: 'Email',
                hintText: 'jon@gmail.com',
                formController: controller.emailController,
                validator: Validator.email,
              ),
              const SizedBox(
                height: 15.0,
              ),
              FormRegistrationWidget(
                obscureText: controller.visible.value,
                formTitle: 'Password',
                hintText: "********",
                formController: controller.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "masukkan password";
                  } else if (controller.passwordController.value.text.length <
                      6) {
                    return "kata sandi harus 6 karakter atau lebih";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.visible.value = !controller.visible.value;
                    log(controller.visible.value.toString());
                  },
                  icon: Icon(
                    controller.visible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              FormRegistrationWidget(
                formTitle: 'Nama Outlet',
                formController: controller.namaOutlet,
                hintText: 'JonSeluler',
                validator: Validator.required,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Jenis Outlet',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6.0,
              ),
              
              FormAddressWidget(
                formTitle: "Alamat Outlet",
                formController: controller.alamatOutlet,
                hintText:
                    "JL Gatot Subroto, No. 40 Tambaksari, Sidanegara, Kecamatan Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah ",
                validator: Validator.required,
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  controller.isCheck.value = !controller.isCheck.value;
                  print(controller.isCheck);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      activeColor: AppColors.primaryColor,
                      value: controller.isCheck(),
                      onChanged: (value) {
                        controller.isCheck(value);
                        print(value);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "Saya menyetujui Syarat dan Ketentuan serta Kebijakan Privasi MV Shop",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: controller.isCheck.value
                      ? () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.onSubmit();
                          }
                          log("Failed Login");
                        }
                      : null,
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              8.verticalSpace
            ],
          ),
        ),
      );
    });
  }
}

Widget _headerAppbar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(8),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.11,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(32, 201, 201, 201),
          blurRadius: 7,
          offset: Offset(0, 10),
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        15.verticalSpace,
        Row(
          children: [
            IconButton(
              color: Colors.black,
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                size: 25.0,
              ),
            ),
            const Text(
              "Registrasi",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ),
  );
}
