import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

class LoadingCustomWidget extends StatelessWidget {
  final Color leftColor;
  final Color rightColor;

  const LoadingCustomWidget({
    super.key,
    this.leftColor = AppColors.primaryColor,
    this.rightColor = const Color.fromARGB(255, 20, 20, 20),
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.flickr(
        leftDotColor: leftColor, rightDotColor: rightColor, size: 26);
  }
}
