// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/auth/registration/controllers/registration_controller.dart';
import '../../../../global/widgets/custom_snackbar.dart';
import '../../../../global/theme/my_colors.dart';
import 'widgets/form_registration_widget.dart';

class RegistrationView extends StatelessWidget {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? outletController;
  TextEditingController? addressController;
  String selectedGender = '';

  RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Form(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _headerAppbar(context),
              _bodyContains(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyContains(BuildContext context) {
    RegistrationController controller = Get.find();
    return SizedBox(
      height: MediaQuery.of(context).size.height - 115,
      child: ListView(
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(
            top: 16,
            left: 22,
            right: 22,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        children: [
          const SizedBox(
            height: 15.0,
          ),
          FormRegistrationWidget(
            formTitle: 'Email',
            initialValue: "jonwik@gmail.com",
            formController: emailController,
          ),
          const SizedBox(
            height: 15.0,
          ),
          FormRegistrationWidget(
            obscureText: true,
            formTitle: 'Password',
            initialValue: "jonwik123",
            formController: passwordController,
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
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30,
                ),
              ),
            ),
            child: FormGenderWidget(),
          ),
          const SizedBox(
            height: 15.0,
          ),
          FormRegistrationWidget(
            formTitle: 'Nama Outlet',
            formController: outletController,
            hintText: 'JonSeluler',
          ),
          const SizedBox(
            height: 15.0,
          ),
          FormAddressWidget(
              formTitle: "Alamat Outlet",
              formController: addressController,
              hintText:
                  "JL Gatot Subroto, No. 40 Tambaksari, Sidanegara, Kecamatan Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah ",
              initialValue: ""),
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
              onPressed: () async {
                controller.onSubmit();
                CustomSnackBar.showCustomToast(
                    message: "Registrasi Berhasil, silahkan login");
              },
              child: const Text("Daftar"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _headerAppbar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(8),
    width: Get.width,
    height: Get.height / 10,
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
