// ignore_for_file: unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/validator.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../global/theme/my_colors.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  32.verticalSpace,
                  SvgPicture.asset(
                    "assets/images/login-img.svg",
                    width: 240.w,
                    height: 180.h,
                  ),
                  40.verticalSpace,
                  Form(
                    key: controller.formField,
                    child: Column(
                      children: [
                        _emailForm(context),
                        16.verticalSpace,
                        _passwordForm(context),
                        _forgotPassword(),
                        _loginButton(),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                          child:
                              Divider(color: Colors.grey[350], thickness: 1.5)),
                      16.horizontalSpace,
                      Text("atau",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 14.sp)),
                      16.horizontalSpace,
                      Expanded(
                          child:
                              Divider(color: Colors.grey[350], thickness: 1.5)),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Belum memiliki akun? ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.REGISTRATION),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Text(
            'Hak Cipta © 2023 Marvelindo Sales',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }

  Widget _forgotPassword() {
    return Row(
      children: [
        Checkbox(
          value: controller.rememberMe.value,
          onChanged: (value) {
            controller.rememberMe.toggle();
          },
          activeColor: Colors.blue,
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.rememberMe.toggle();
            log("Remember Me : ${controller.rememberMe.value}");
          },
          child: Text(
            "Ingat Saya",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12.sp,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Lupa Password?",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  OutlinedButton _guestButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(
          color: AppColors.secondary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        maximumSize: const Size(double.infinity, 42),
        minimumSize: const Size(double.infinity, 42),
      ),
      onPressed: () {
        // Get.offNamed(Routes.BASE);
        log("Token : ${controller.box.read("TOKEN")}");
        // controller.box.erase();
        log("Token Delete : ${controller.box.read("TOKEN")}");
      },
      child: const Text(
        "Delete Local",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  TextFormField _emailForm(context) {
    return TextFormField(
      controller: controller.emailController,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height),
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: Colors.grey[400],
        fillColor: Colors.grey[80],
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
        hintText: "Email",
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.email_rounded,
          ),
        ),
      ),
      validator: Validator.email,
    );
  }

  TextFormField _passwordForm(context) {
    return TextFormField(
      obscureText: controller.visible.value,
      controller: controller.passwordController,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height),
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: Colors.grey[400],
        fillColor: Colors.grey[80],
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
        hintText: "Password",
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.lock,
          ),
        ),
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
      validator: (value) {
        if (value!.isEmpty) {
          return "masukkan password";
        }
        // else if (controller.passwordController.value.text.length < 8) {
        //   return "kata sandi harus 8 karakter atau lebih";
        // }
        return null;
      },
    );
  }

  ElevatedButton _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        maximumSize: const Size(double.infinity, 42),
        minimumSize: const Size(double.infinity, 42),
      ),
      onPressed: () {
        if (controller.formField.currentState!.validate()) {
          printInfo(info: "success");
          // controller.onSignIn();
          controller.doLogin();
        }
        log("Failed Login");
      },
      child: controller.isTap.value
          ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                backgroundColor: Colors.white,
                color: AppColors.primaryColor,
              ),
            )
          : const Text(
              "Masuk",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        Get.toNamed(Routes.API_TEST);
      },
      child: const Text("TEST",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
    );
  }
}
