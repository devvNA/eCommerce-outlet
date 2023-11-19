import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

class InputChatWidget extends StatelessWidget {
  const InputChatWidget(
      {super.key,
      this.onTapAdd,
      this.onTapCamera,
      this.onTapSend,
      this.controller});

  final TextEditingController? controller;
  final Function()? onTapAdd;
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: const Color(0xffF6F6F6),
            onPressed: onTapAdd,
            icon: const Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: onTapCamera,
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black54,
                    ),
                  ),
                  fillColor: const Color(0xffF6F6F6),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  hintText: 'Ketuk untuk menulis....',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onTapSend,
            icon: const Icon(
              Icons.send,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
