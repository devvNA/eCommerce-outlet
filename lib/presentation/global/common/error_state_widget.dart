import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;

  const ErrorStateWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: LightThemeColors.error,
              size: 32.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
