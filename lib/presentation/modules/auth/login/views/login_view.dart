import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';
import '../../../../global/widgets/custom_snackbar.dart';
import '../../../../global/theme/light_theme_colors.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: ListView(
        primary: true,
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(top: Get.height / 6),
        children: <Widget>[
          const Center(
            child: Text(
              "Login",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/mv-logo.png",
                fit: BoxFit.cover,
                width: 200,
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    Form(
                      key: controller.formField.value,
                      child: Column(
                        children: [
                          _emailForm(),
                          12.verticalSpace,
                          _passwordForm(),
                          12.verticalSpace,
                          _loginButton(),
                          // 5.verticalSpace,
                          // _devModeButton()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[350],
                            thickness: 1.5,
                          ),
                        ),
                        const Text("\t atau masuk dengan \t",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            )),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[350],
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _loginGoogleButton(),
                    const SizedBox(
                      height: 8.0,
                    ),
                    // TestButton(),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Belum memiliki akun ? ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
/*                               Get.snackbar(
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.all(12),
                                  "Belum Tersedia",
                                  "masih dalam pengembangan",
                                  backgroundColor: Colors.red[600],
                                  colorText: Colors.white,
                                  icon: Icon(
                                    Icons.warning_amber,
                                    color: Colors.amber[400],
                                    weight: 10,
                                    size: 25,
                                  ),
                                  backgroundGradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.blue.withOpacity(0.5),
                                      AppColors.primaryColor,
                                    ],
                                  ),
                                );
                                #############################
                                CustomSnackBar.showCustomErrorToast();
 */
                            Get.toNamed(Routes.REGISTRATION);
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _devModeButton(),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ));
    });
  }

  ElevatedButton _devModeButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        maximumSize: const Size(double.infinity, 42),
        minimumSize: const Size(double.infinity, 42),
      ),
      onPressed: () {
        Get.offNamed(Routes.BASE);
      },
      child: const Text(
        "DEV Mode",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  TextFormField _emailForm() {
    return TextFormField(
      controller: controller.emailController.value,
      scrollPadding: EdgeInsets.only(bottom: Get.height),
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: AppColors.primaryColor,
        fillColor: Colors.grey[80],
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        hintText: "Email",
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "masukkan email";
        } else if (controller.regex.value.hasMatch(value)) {
          return null;
        }
        return "email tidak valid";
      },
    );
  }

  TextFormField _passwordForm() {
    return TextFormField(
      obscureText: controller.visible.value,
      controller: controller.passwordController.value,
      scrollPadding: EdgeInsets.only(bottom: Get.height),
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
          borderSide: BorderSide.none,
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
        } else if (controller.passwordController.value.text.length < 8) {
          return "kata sandi harus 8 karakter atau lebih";
        }
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
        if (controller.formField.value.currentState!.validate()) {
          printInfo(info: "success");
          controller.onSignIn();
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
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
    );
  }

  OutlinedButton _loginGoogleButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: const BorderSide(
          color: AppColors.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        maximumSize: const Size(double.infinity, 42),
        minimumSize: const Size(double.infinity, 42),
      ),
      onPressed: () {
        controller.onGoogleSignIn();
      },
      child: controller.isGoogleTap.value
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/google-icon.svg",
                  width: 22,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text("Google"),
              ],
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
      child: const Text("TEST"),
    );
  }
}
