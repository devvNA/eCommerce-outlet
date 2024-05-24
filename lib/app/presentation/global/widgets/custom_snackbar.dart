import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static showCustomSuccessSnackBar(
      {required String title,
      required String message,
      Duration? duration,
      bool? isDismissible,
      Color? color}) {
    Get.snackbar(title, message,
        duration: duration ?? const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        backgroundColor: color ?? const Color.fromARGB(255, 71, 171, 75),
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        isDismissible: isDismissible ?? true);
  }

  static showCustomErrorSnackBar(
      {required String title,
      required String message,
      bool? isDismissible,
      Color? color,
      Duration? duration}) {
    Get.snackbar(title, message,
        duration: duration ?? const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        colorText: Colors.white,
        backgroundColor: color ?? Colors.redAccent,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        isDismissible: isDismissible ?? true);
  }

  static showCustomToast(
      {String? title,
      required String message,
      Color? color,
      bool? isDismissible,
      Duration? duration}) {
    Get.rawSnackbar(
        title: title,
        duration: duration ?? const Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: color ?? Colors.green,
        onTap: (snack) {
          Get.closeAllSnackbars();
        },
        //overlayBlur: 0.8,
        message: message,
        isDismissible: isDismissible ?? true);
  }

  static showCustomErrorToast({
    String? title,
    String? message,
    bool? isDismissible,
    Color? color,
    Duration? duration,
  }) {
    Get.rawSnackbar(
        // title: title ?? "Error",
        duration: duration ?? const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: color ?? const Color.fromARGB(242, 225, 31, 18),
        onTap: (snack) {
          Get.closeAllSnackbars();
        },
        //overlayBlur: 0.8,
        message: message ?? "masih dalam pengembangan",
        isDismissible: isDismissible ?? true);
  }
}
