// ignore_for_file: unnecessary_overrides
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/modules/cart/views/cart_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/history/views/history_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/home/views/home_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/settings/views/settings_view.dart';

class BaseController extends GetxController {
  DateTime timeBackPressed = DateTime.now();
  final currentIndex = 0.obs;
  final pages = [
    const HomeView(),
    const CartView(),
    const HistoryView(),
    const SettingsView(),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onBack() {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(milliseconds: 1500);
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

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex(selectedIndex);
    log("halaman index = $currentIndex");
  }
}
