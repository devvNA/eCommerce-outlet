// ignore_for_file: must_be_immutable, unused_field
import 'package:flutter/material.dart';

import '../../../../../global/theme/my_colors.dart';

class FormRegistrationWidget extends StatelessWidget {
  final String formTitle;
  final String? initialValue;
  final String? hintText;
  final TextEditingController? formController;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;

  const FormRegistrationWidget({
    super.key,
    required this.formTitle,
    this.initialValue,
    this.hintText,
    this.formController,
    this.obscureText = false,
    this.validator,
    this.contentPadding,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        TextFormField(
          validator: validator,
          cursorColor: AppColors.primaryColor,
          obscureText: obscureText!,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  MediaQuery.of(context).size.height),
          initialValue: initialValue,
          controller: formController,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.all(16),
            prefixIconColor: AppColors.primaryColor,
            suffixIconColor: Colors.grey[400],
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xFFD3D3D3),
                fontSize: 14,
                fontWeight: FontWeight.w500),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class FormAddressWidget extends StatelessWidget {
  final String formTitle;
  final String? initialValue;
  final String? hintText;
  final TextEditingController? formController;
  final String? Function(String?)? validator;

  const FormAddressWidget({
    super.key,
    required this.formTitle,
    this.initialValue,
    this.hintText,
    this.formController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        TextFormField(
          validator: validator,
          maxLines: 5,
          cursorColor: AppColors.primaryColor,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  MediaQuery.of(context).size.height),
          initialValue: initialValue,
          controller: formController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            prefixIconColor: AppColors.primaryColor,
            suffixIconColor: Colors.grey[400],
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xFFD3D3D3),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class ReusableFormWidget extends StatelessWidget {
  final String formTitle;
  final String? initialValue;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int maxLines;
  final BorderRadius? borderRadius;

  const ReusableFormWidget({
    super.key,
    required this.formTitle,
    this.initialValue,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.contentPadding,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6.0),
        TextFormField(
          validator: validator,
          cursorColor: AppColors.primaryColor,
          obscureText: obscureText,
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                MediaQuery.of(context).size.height,
          ),
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.all(16),
            prefixIconColor: AppColors.primaryColor,
            suffixIconColor: Colors.grey[400],
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(32),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(32),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(32),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFD3D3D3),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
