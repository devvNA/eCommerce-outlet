import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

/* Variant: debug
Config: debug
Store: C:\Users\devit\.android\debug.keystore
Alias: AndroidDebugKey
MD5: 7F:B8:36:29:3C:F9:B9:8E:3F:F7:EB:AE:FE:16:5E:E7
SHA1: F8:2A:E7:84:83:90:86:7A:30:58:28:F7:BE:71:F5:AF:A4:E2:5B:B0
SHA-256: 9A:6B:1E:56:F4:83:EC:78:90:0D:57:8F:BA:22:DD:97:1D:3B:98:11:2F:39:5B:7C:C3:17:78:E3:43:30:EF:A4
Valid until: Monday, 9 February 2054
---------- */

abstract class FirebaseAuthService {
  Future<User?> signInWithGoogle();
  Future<bool> signOut();
  String? getCurrentSignedInUserEmail();
  String? getCurrentSignedInUserEmailDisplayName();
  bool isLoggedIn();
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  @override
  Future<User?> signInWithGoogle() async {
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
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      box.write("accessToken", credential.accessToken);

      debugPrint("userCredential: $userCredential");
      log("ACCESS TOKEN: ${credential.accessToken}");

      await Get.offNamed(Routes.BASE);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint('Error signInWithGoogle: $e, $stackTrace');
      }
      return null;
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
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

  @override
  String? getCurrentSignedInUserEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }

  @override
  String? getCurrentSignedInUserEmailDisplayName() {
    return FirebaseAuth.instance.currentUser?.displayName;
  }

  @override
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
