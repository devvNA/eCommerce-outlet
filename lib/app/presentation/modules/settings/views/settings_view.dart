// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../global/widgets/custom_snackbar.dart';
import '../../../global/widgets/screen_title.dart';
import '../../../global/theme/my_colors.dart';
import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            const ScreenTitle(
              title: 'Pengaturan',
            ),
            20.verticalSpace,
            SettingsItem(
              onTap: () => controller.toEditProfilePage(),
              title: 'Edit Profil',
              icon: Icons.edit_note_sharp,
            ),
            20.verticalSpace,
            SettingsItem(
              onTap: () {
                controller.onKontak();
              },
              title: 'Kontak',
              icon: Icons.contact_phone,
            ),
            20.verticalSpace,
            SettingsItem(
              onTap: () {
                CustomSnackBar.showCustomErrorToast();
              },
              title: 'Tentang Kami',
              icon: Icons.info_outline_rounded,
            ),
            20.verticalSpace,
            SettingsItem(
              onTap: () {
                CustomSnackBar.showCustomErrorToast();
              },
              title: 'Kebijakan & Privasi',
              icon: Icons.shield_outlined,
            ),
            20.verticalSpace,
            controller.firebaseAuth.isLoggedIn()
                ? SettingsItem(
                    title: 'Keluar',
                    icon: Icons.logout,
                    onTap: () async {
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Apakah anda yakin ingin keluar?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.primaryColor,
                                  side: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Tidak"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () {
                                  controller
                                      .signOut()
                                      .then((value) => controller.dispose());
                                },
                                child: const Text("Ya"),
                              ),
                            ],
                          ).animate().fade();
                        },
                      );
                    },
                  )
                : SettingsItem(
                    onTap: controller.toLoginPage,
                    title: "Login",
                    icon: Icons.login,
                  ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
