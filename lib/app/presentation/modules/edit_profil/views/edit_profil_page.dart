import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/networking/firebase_auth_services.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/validator.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/custom_snackbar.dart';
import 'package:marvelindo_outlet/app/presentation/modules/edit_profil/controller/edit_profil_controller.dart';

import '../../../global/widgets/form_text_widget.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            if (controller.formKey.currentState!.validate()) {
              Get.back();
              CustomSnackBar.showCustomSuccessSnackBar(
                title: "Success",
                message: "Profil berhasil diubah",
              );
              log("Success");
            } else {
              log("Error");
            }
          },
        ),
        appBar: AppBar(
          title: const Text('Edit Profil'),
          centerTitle: true,
        ),
        body: Obx(() {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20.0),
                    children: [
                      const Text(
                        "Data Diri",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      20.verticalSpace,
                      const Text(
                        "Nama Lengkap",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      FormTextWidget(
                        textFormController: controller.namaController.value,
                        validator: Validator.required,
                        hintText: FirebaseAuthServices.getUsername(),
                      ),
                      15.verticalSpace,
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      FormTextWidget(
                        textFormController: controller.emailController.value,
                        validator: Validator.email,
                        hintText: FirebaseAuthServices.getEmail(),
                      ),
                      15.verticalSpace,
                      const Text(
                        "Nama Outlet",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      FormTextWidget(
                        textFormController: controller.outletController.value,
                        validator: Validator.required,
                      ),
                      15.verticalSpace,
                      const Text(
                        "Jenis Outlet",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      _dropDown(context, controller),
                      15.verticalSpace,
                      const Text(
                        "Alamat",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      const FormTextWidget(
                        maxlines: 5,
                        validator: Validator.required,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }

  DropdownButtonFormField _dropDown(
      BuildContext context, EditProfilController controller) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          prefixIconColor: AppColors.primaryColor,
          suffixIconColor: Colors.grey[400],
          fillColor: const Color(0xFFE7E5E5),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.indigo),
          ),
          hintText: "pilih jenis outlet",
        ),
        focusColor: const Color(0xFFE7E5E5),
        style: context.theme.textTheme.bodyMedium
            ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
        elevation: 3,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: const Color(0xFFF0F0F0),
        value: controller.selectedOutlet,
        validator: Validator.required,
        onChanged: (value) {
          controller.onSelectedOutlet(value);
        },
        items: controller.listJenisOutlet);
  }
}
