import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static showCustomSnackBar(
      {required String title,
      required String message,
      Duration? duration,
      required Color? color}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: color ?? Colors.amber,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static showCustomErrorSnackBar(
      {required String title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: color ?? Colors.redAccent,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  static showCustomToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.green,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }

  static showCustomErrorToast(
      {String? title, String? message, Color? color, Duration? duration}) {
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
    );
  }
}
