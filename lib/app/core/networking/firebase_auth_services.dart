import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

import '../../presentation/global/theme/my_colors.dart';

// abstract class FirebaseAuthService {
//   Future<User?> signInWithGoogle();
//   Future<bool> signOut();
//   String? getCurrentSignedInUserEmail();
//   String? getCurrentSignedInUserEmailDisplayName();
//   String getUsername();
//   String getEmail();
//   String getDisplayProfile();
//   bool isLoggedIn();
// }

//google_sign_in: ^4.5.1

class FirebaseAuthServices {
  static Future<User?> signInWithGoogle() async {
    final box = GetStorage();

    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      box.write("accessToken", credential.accessToken);
      debugPrint("userCredential: $userCredential");
      log("ACCESS TOKEN: ${credential.accessToken}");

      Get.offNamed(Routes.BASE);
      Get.snackbar("Sukses", "anda berhasil login",
          colorText: Colors.white, backgroundColor: AppColors.green1);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        log('Error signInWithGoogle: $e, $stackTrace');
      }
      return null;
    }
    return null;
  }

  static Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error signInWithGoogle: $e, $stackTrace');
      }
      return false;
    }
  }

  static bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static String getUsername() {
    return FirebaseAuth.instance.currentUser?.displayName ?? "Guest";
  }

  static String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? "Guest";
  }

  static String getDisplayProfile() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        "https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg=";
  }

  static int getUID() {
    return FirebaseAuth.instance.currentUser?.uid.hashCode ?? 1;
  }
}
