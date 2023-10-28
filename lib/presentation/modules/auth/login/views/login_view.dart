// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/common/custom_snackbar.dart';
import '../../../../global/theme/light_theme_colors.dart';
import '../../../../routes/app_pages.dart';
import '../controller/login_controller.dart';
import 'widget/form_login_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<LoginController>(
      builder: (_) {
        return ListView(
          primary: true,
          shrinkWrap: true,
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.only(top: Get.height / 5.5),
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
                  child: Form(
                    child: Column(
                      children: [
                        const FormFieldLogin(
                          initialValue: "jonwik@gmail.com",
                          hinText: "Email anda",
                          value: "email",
                          keyboardType: TextInputType.emailAddress,
                          icon: Icon(
                            Icons.person,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const FormFieldLogin(
                          initialValue: "jonwik123",
                          obscureText: true,
                          hinText: "Password anda",
                          value: "password",
                          keyboardType: TextInputType.text,
                          icon: Icon(
                            Icons.lock,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            shape: const StadiumBorder(),
                            maximumSize: const Size(double.infinity, 45),
                            minimumSize: const Size(double.infinity, 45),
                          ),
                          onPressed: () {
                            controller.onSignIn();
                          },
                          child: controller.isTap
                              ? const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              : const Text(
                                  "Masuk",
                                  style: TextStyle(fontWeight: FontWeight.w600),
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
                                thickness: 1,
                              ),
                            ),
                            const Text("\t atau lanjutkan dengan \t",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                )),
                            Expanded(
                              child: Divider(
                                color: Colors.grey[350],
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                elevation: 2,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {
                                try {
                                  controller.onGoogleSignIn();
                                } on Exception catch (err) {
                                  debugPrint(err.toString());
                                }
                              },
                              child: controller.isGoogleTap
                                  ? const SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        backgroundColor: Colors.white,
                                      ),
                                    )
                                  : Image.asset(
                                      "assets/icons/google-icon.png",
                                      width: 30,
                                    ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                elevation: 2,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () async {
                                // await controller.onFacebookSignIn();
                                await CustomSnackBar.showCustomErrorToast();
                              },
                              child: Image.asset(
                                "assets/icons/facebook-icon.png",
                                width: 30.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        OutlinedButton(
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
                        ),
                        const SizedBox(height: 16.0),
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
                                    LightThemeColors.primaryColor,
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
                                  color: LightThemeColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        );
      },
    ));
  }
}
