import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/services/firebase_auth_services.dart';
import '../../../global/theme/my_theme.dart';
import '../../../global/utils/my_shared_pref.dart';
import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  final FirebaseAuthService firebaseAuthService;

  SettingsController({required this.firebaseAuthService});


  // get is light theme from shared pref
  var isLightTheme = MySharedPref.getThemeIsLight();

  /// change the system theme
  changeTheme(bool value) {
    MyTheme.changeTheme();
    isLightTheme = MySharedPref.getThemeIsLight();
    update(['Theme']);
  }

  Future<void> signOut() async {
    // Get.back();
    await firebaseAuthService.signOut();
    await Get.offAllNamed(Routes.SPLASH);
  }
}
