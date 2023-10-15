// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed(Routes.LOGIN);
    super.onInit();
  }
/* 
  // final FirebaseAuthService firebaseAuthService;

  // SplashController({
  //   required this.firebaseAuthService,
  // });

  // @override
  // void onInit() {
  //   super.onInit();

  //   Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
  //     await isUserSignedInWithGoogle();
  //   });
  // }

  Future<void> isUserSignedInWithGoogle() async {
    if (FirebaseAuth.instance.currentUser != null) {
      // User Is Signed In with Google
      // Check is user registered?
      await isUserRegistered();
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> isUserRegistered() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    // email != null artinya user sudah sign-in with google
    if (email != null) {
      User? userData;
      if (userData != null) {
        // User is Registered
        // Navigate to Dashboard Page
        Get.offAllNamed(Routes.BASE);
      } else {
        // User is Signed In & Is not Registered
        // Navigate to Register Form Page
        Get.offAllNamed(Routes.REGISTRATION);
      }
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.LOGIN);
    }
  } */
}
