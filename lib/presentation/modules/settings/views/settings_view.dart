// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../global/common/custom_snackbar.dart';
import '../../../global/common/screen_title.dart';
import '../../../global/theme/light_theme_colors.dart';
import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
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
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text('Account',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            5.verticalSpace,
            SettingsItem(
              onTap: () {
                Get.toNamed(Routes.PROFIL);
              },
              title: "Profil",
              icon: Constants.userIcon,
            ),
            20.verticalSpace,
            Text('Settings',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
/*             25.verticalSpace,
            SettingsItem(
              isDark: true,
              onTap: () {
                CustomSnackBar.showCustomErrorToast();
              },
              title: 'Tema',
              icon: Constants.themeIcon,
            ),
 */
            25.verticalSpace,
            SettingsItem(
              onTap: () {
                CustomSnackBar.showCustomErrorToast();
              },
              title: 'Bantuan',
              icon: Constants.helpIcon,
            ),
            25.verticalSpace,
            SettingsItem(
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
                            foregroundColor: LightThemeColors.primaryColor,
                            side: const BorderSide(
                              color: LightThemeColors.primaryColor,
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
              title: 'Keluar',
              icon: Constants.logoutIcon,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
