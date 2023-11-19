// ignore_for_file: must_be_immutable, unused_field

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/theme/light_theme_colors.dart';

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
              bottom: MediaQuery.of(context).viewInsets.bottom + Get.height),
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
              bottom: MediaQuery.of(context).viewInsets.bottom + Get.height),
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

class FormGenderWidget extends StatelessWidget {
  FormGenderWidget({super.key});

  final List<String> classItems = [
    'Laki-laki',
    'Perempuan',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
          ),
          hint: const Text(
            'jenis Kelamin',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xFFD3D3D3),
                fontWeight: FontWeight.w500),
          ),
          items: classItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'pilih jenis kelamin';
            }
            return null;
          },
          onChanged: (value) {},
          onSaved: (value) {
            selectedValue = value.toString();
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ],
    );
  }
}
