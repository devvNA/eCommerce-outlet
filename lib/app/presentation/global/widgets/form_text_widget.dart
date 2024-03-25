import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';

class FormTextWidget extends StatelessWidget {
  final TextEditingController? textFormController;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final int? maxlines;
  final EdgeInsetsGeometry? contentPadding;

  const FormTextWidget({
    super.key,
    this.textFormController,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.maxlines,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textFormController,
      scrollPadding: EdgeInsets.only(bottom: Get.height),
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType,
      maxLines: maxlines,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.all(15),
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: Colors.grey[400],
        fillColor: Colors.grey[80],
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.indigo),
        ),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
