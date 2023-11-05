import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  DateTime timeBackPressed = DateTime.now();

  onBack() {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(seconds: 2);
    timeBackPressed = DateTime.now();
    if (isExitWarning) {
      const message = "Tekan kembali lagi untuk keluar";
      Fluttertoast.showToast(msg: message, fontSize: 16);
      return false;
    } else {
      Fluttertoast.cancel();
      return true;
    }
  }

  // current screen index
  RxInt currentIndex = RxInt(0);

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex.value = selectedIndex;
    log("halaman index = $currentIndex");
    update();
  }
}
