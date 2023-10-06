import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../global/theme/light_theme_colors.dart';


class FormFieldLogin extends StatelessWidget {
  final String hinText;
  final String value;
  final String? initialValue;
  final TextInputType keyboardType;
  final Widget icon;
  final bool? obscureText;

  const FormFieldLogin({
    super.key,
    required this.hinText,
    required this.value,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText!,
      scrollPadding: EdgeInsets.only(bottom: Get.height),
      cursorColor: LightThemeColors.primaryColor,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      onSaved: (value) {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        prefixIconColor: LightThemeColors.primaryColor,
        suffixIconColor: LightThemeColors.primaryColor,
        fillColor: Colors.grey[100],
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        hintText: hinText,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: icon,
        ),
      ),
    );
  }
}
