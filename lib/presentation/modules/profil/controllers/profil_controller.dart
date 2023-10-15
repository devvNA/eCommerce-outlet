import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  String? getUsername() {
    return auth.currentUser?.displayName ?? "Invalid";
  }

  String? getEmail() {
    return auth.currentUser?.email ?? "Invalid";
  }

  String? getDisplayProfile() {
    return auth.currentUser?.photoURL ??
        "https://media.istockphoto.com/id/1289670343/vector/invalid-stamp-invalid-label-round-grunge-sign.jpg?s=612x612&w=0&k=20&c=p654_tY0_Nd5N0yYbE9aNJpblSykywX9nw0g_fe4D5k=";
  }
}
