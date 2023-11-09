import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class NoData extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;

  const NoData({super.key, this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
        ),
        Image.asset(Constants.noData, width: 100),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          text ?? 'No Data',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: const Text(
            "Mulai belanja, yuk!",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
