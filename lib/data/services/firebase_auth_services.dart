import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

abstract class FirebaseAuthService {
  Future<User?> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
  Future<bool> signOut();
  bool isUserSignedIn();
  String? getCurrentSignedInUserEmail();
  String? getCurrentSignedInUserEmailDisplayName();
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  @override
  Future<User?> signInWithGoogle() async {
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
      debugPrint("userCredential: $userCredential");
      await Get.offNamed(Routes.BASE);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error signInWithGoogle: $e, $stackTrace');
      }
      return null;
    }
    return null;
  }

  @override
//flutter_facebook_auth: ^1.0.0
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
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
  bool isUserSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
