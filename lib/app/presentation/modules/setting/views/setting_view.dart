import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/theme/my_colors.dart';
import '../../../global/widgets/screen_title.dart';
import '../controllers/setting_controller.dart';
import 'widgets/settings_item.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          20.verticalSpace,
          const ScreenTitle(
            title: 'Pengaturan',
          ),
          Expanded(
            child: ListView(
              children: [
                SettingItem(
                  onTap: () => controller.toEditProfilePage(),
                  title: 'Edit Profil',
                  icon: Icons.edit_note_sharp,
                ),
                20.verticalSpace,
                SettingItem(
                  onTap: () {
                    controller.onContact();
                  },
                  title: 'Kontak',
                  icon: Icons.contact_phone,
                ),
                20.verticalSpace,
                SettingItem(
                  onTap: () {
                    Get.toNamed(Routes.ABOUT_US);
                  },
                  title: 'Tentang Kami',
                  icon: Icons.info_outline_rounded,
                ),
                20.verticalSpace,
                SettingItem(
                  onTap: () {
                    Get.toNamed(Routes.POLICIES_PRIVACY);
                  },
                  title: 'Kebijakan & Privasi',
                  icon: Icons.privacy_tip_outlined,
                ),
                20.verticalSpace,
                // FirebaseAuthServices.isLoggedIn()
                //     ? SettingItem(
                //         title: 'Keluar',
                //         icon: Icons.logout,
                //         onTap: () async {
                //           await showDialog<void>(
                //             context: context,
                //             barrierDismissible: true,
                //             builder: (BuildContext context) {
                //               return AlertDialog(
                //                 elevation: 3,
                //                 clipBehavior: Clip.antiAlias,
                //                 title: const Text('Konfirmasi'),
                //                 content: const SingleChildScrollView(
                //                   child: ListBody(
                //                     children: <Widget>[
                //                       Text('Apakah anda yakin ingin keluar?'),
                //                     ],
                //                   ),
                //                 ),
                //                 actions: <Widget>[
                //                   ElevatedButton(
                //                     style: ElevatedButton.styleFrom(
                //                       backgroundColor: Colors.white,
                //                       foregroundColor: AppColors.primaryColor,
                //                       side: const BorderSide(
                //                         color: AppColors.primaryColor,
                //                       ),
                //                     ),
                //                     onPressed: () {
                //                       Get.back();
                //                     },
                //                     child: const Text(
                //                       "Tidak",
                //                       style: TextStyle(
                //                         color: AppColors.primaryColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.normal,
                //                       ),
                //                     ),
                //                   ),
                //                   ElevatedButton(
                //                     style: ElevatedButton.styleFrom(),
                //                     onPressed: () {
                //                       controller.signOut().then(
                //                           (value) => controller.dispose());
                //                     },
                //                     child: const Text(
                //                       "Ya",
                //                       style: TextStyle(
                //                         color: Colors.white,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.normal,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               );
                //             },
                //           );
                //         },
                //       )
                //     : SettingItem(
                //         onTap: controller.toLoginPage,
                //         title: "Login",
                //         icon: Icons.login,
                //       ),
                SettingItem(
                  title: 'Keluar',
                  icon: Icons.logout,
                  onTap: () async {
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          elevation: 3,
                          clipBehavior: Clip.antiAlias,
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
                                Get.back();
                              },
                              child: const Text(
                                "Tidak",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(),
                              onPressed: () {
                                controller
                                    .signOut()
                                    .then((value) => controller.dispose());
                              },
                              child: const Text(
                                "Ya",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
