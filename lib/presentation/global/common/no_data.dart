import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class NoData extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  const NoData({Key? key, this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Image.asset(Constants.noData, width: 160),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            text ?? 'No Data',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: const StadiumBorder(),
            ),
            onPressed: onPressed,
            child: const Text(
              "Mulai belanja, yuk!",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
