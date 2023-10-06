import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/common/custom_snackbar.dart';
import '../../../../global/routes/app_pages.dart';
import '../../../../global/theme/light_theme_colors.dart';
import 'widgets/form_registration_widget.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? outletController;
  TextEditingController? addressController;
  String selectedGender = '';

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
              _headerAppbar(),
              _bodyContains(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyContains() {
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
          FormRegistrationWidget(
            formTitle: 'Nama Lengkap',
            formController: nameController,
            hintText: 'Jon Wik',
          ),
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
            'Jenis Kelamin',
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
              hintText: "JL Menuju Surga",
              initialValue: ""),
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: LightThemeColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
                Get.offNamed(Routes.LOGIN);
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

Widget _headerAppbar() {
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
