// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../theme/light_theme_colors.dart';

Future<void> customAlertDialog(
    {required BuildContext context,
    required String title,
    required String description,
    required VoidCallback onPressYes,
    required VoidCallback onPressNo}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(description),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryColor,
              side: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: onPressNo,
            child: const Text("Tidak"),
          ),
          ElevatedButton(
            onPressed: onPressYes,
            child: const Text("Ya"),
          ),
        ],
      );
    },
  );
}
