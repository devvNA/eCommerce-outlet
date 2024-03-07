import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseController extends GetxController {
  DateTime timeBackPressed = DateTime.now();

  onBack() {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(seconds: 2);
    timeBackPressed = DateTime.now();
    if (isExitWarning) {
      const message = "Tekan kembali lagi untuk keluar";
      Fluttertoast.showToast(msg: message, fontSize: 12);
      return false;
    } else {
      Fluttertoast.cancel();
      return true;
    }
  }

  // current screen index
  var currentIndex = 0.obs;

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex.value = selectedIndex;
    log("halaman index = $currentIndex");
    update();
  }

  final Uri url = Uri.parse('https://wa.me/6283871647864/');

  Future<void> onChatButton() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
