import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/validator.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import '../../../global/widgets/form_text_widget.dart';
import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfilController>(builder: (controller) {
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
                log("Sucess");
              } else {
                log("Error");
              }
            },
          ),
          appBar: AppBar(
            title: const Text('Edit Profil'),
            centerTitle: true,
          ),
          body: Form(
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
                        ),
                      ),
                      20.verticalSpace,
                      const Text(
                        "Nama Lengkap",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      FormTextWidget(
                        textFormController: controller.namaController,
                        validator: Validator.required,
                      ),
                      15.verticalSpace,
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      FormTextWidget(
                        textFormController: controller.emailController,
                        validator: Validator.email,
                      ),
                      15.verticalSpace,
                      const Text(
                        "Nama Outlet",
                        style: TextStyle(fontSize: 14.0, color: AppColors.gray),
                      ),
                      5.verticalSpace,
                      FormTextWidget(
                        textFormController: controller.outletController,
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
          ));
    });
  }

  Container _dropDown(BuildContext context, EditProfilController controller) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF0F0F0),
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          focusColor: Colors.grey[80],
          padding: const EdgeInsets.symmetric(horizontal: 14),
          style: context.theme.textTheme.bodyMedium
              ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
          elevation: 3,
          borderRadius: BorderRadius.circular(8),
          hint: Text(
            "pilih jenis outlet",
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
            ),
          ),
          dropdownColor: const Color(0xFFF0F0F0),
          isExpanded: true,
          value: controller.selectedPayment,
          onChanged: (selectedPayment) {
            controller.onSelectedPayment(selectedPayment!);
          },
          items: controller.paymentDropDownItems),
    );
  }
}
