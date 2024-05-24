// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/validator.dart';

import '../../../../global/theme/my_colors.dart';
import '../../../../global/widgets/custom_snackbar.dart';
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
                formController: controller.emailController(),
                validator: Validator.email,
              ),
              const SizedBox(
                height: 15.0,
              ),
              FormRegistrationWidget(
                obscureText: true,
                formTitle: 'Password',
                hintText: "********",
                formController: controller.passwordController(),
                validator: Validator.required,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Jenis Outlet',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6.0,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    prefixIconColor: AppColors.primaryColor,
                    suffixIconColor: Colors.grey[400],
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.indigo),
                    ),
                    hintText: "pilih jenis outlet",
                  ),
                  focusColor: const Color(0xFFE7E5E5),
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  elevation: 3,
                  borderRadius: BorderRadius.circular(8),
                  dropdownColor: const Color(0xFFF0F0F0),
                  value: controller.selectedOutlet,
                  validator: Validator.required,
                  onChanged: (value) {
                    controller.onSelectedOutlet(value!);
                  },
                  items: controller.jenisOutlet),
              const SizedBox(
                height: 15.0,
              ),
              FormRegistrationWidget(
                formTitle: 'Nama Outlet',
                formController: controller.nama(),
                hintText: 'JonSeluler',
                validator: Validator.required,
              ),
              const SizedBox(
                height: 15.0,
              ),
              FormAddressWidget(
                formTitle: "Alamat Outlet",
                formController: controller.alamat(),
                hintText:
                    "JL Gatot Subroto, No. 40 Tambaksari, Sidanegara, Kecamatan Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah ",
                validator: Validator.required,
              ),
              const SizedBox(
                height: 25.0,
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
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      printInfo(info: "success");
                      controller.onSubmit();
                      CustomSnackBar.showCustomToast(
                          message: "Registrasi Berhasil, silahkan login");
                    }
                    log("Failed Login");
                  },
                  child: const Text("Daftar"),
                ),
              ),
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
