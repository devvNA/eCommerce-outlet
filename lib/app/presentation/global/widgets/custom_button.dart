import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() ontap;

  const CustomButton({
    super.key,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              32.0,
            ),
          ),
        ),
        child: InkWell(
          onTap: ontap,
          child: const Center(
            child: Text(
              "Tambahkan ke keranjang",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
