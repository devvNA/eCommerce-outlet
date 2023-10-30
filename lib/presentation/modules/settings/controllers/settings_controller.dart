import 'package:get/get.dart';

import '../../../../core/firebase_auth_services.dart';
import '../../../global/theme/my_theme.dart';
import '../../../../utils/my_shared_pref.dart';
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
