// ignore_for_file: must_be_immutable, unused_field
import 'package:flutter/material.dart';

import '../../../../../global/theme/my_colors.dart';

class FormRegistrationWidget extends StatelessWidget {
  final String formTitle;
  final String? initialValue;
  final String? hintText;
  final TextEditingController? formController;
  final bool? obscureText;

  const FormRegistrationWidget({
    super.key,
    required this.formTitle,
    this.initialValue,
    this.hintText,
    this.formController,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        TextFormField(
          cursorColor: AppColors.primaryColor,
          obscureText: obscureText!,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  MediaQuery.of(context).size.height),
          initialValue: initialValue,
          controller: formController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xFFD3D3D3),
                fontSize: 16,
                fontWeight: FontWeight.w500),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (value) {},
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

  const FormAddressWidget({
    super.key,
    required this.formTitle,
    this.initialValue,
    this.hintText,
    this.formController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        TextFormField(
          maxLines: 5,
          cursorColor: AppColors.primaryColor,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  MediaQuery.of(context).size.height),
          initialValue: initialValue,
          controller: formController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xFFD3D3D3),
                fontSize: 16,
                fontWeight: FontWeight.w500),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
