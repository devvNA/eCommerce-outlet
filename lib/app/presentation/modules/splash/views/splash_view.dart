import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';
import '../../../../core/utils/helpers/constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return Scaffold(
      body: GetBuilder<SplashController>(builder: (value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constants.logo,
                width: 100,
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 2,
                  curve: Curves.easeInSine),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'CV ',
                    style: theme.textTheme.displayMedium
                        ?.copyWith(color: theme.primaryColor),
                  ),
                  TextSpan(
                    text: 'Marvelindo',
                    style: theme.textTheme.displayMedium
                        ?.copyWith(color: AppColors.h1),
                  ),
                ]),
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 5,
                  curve: Curves.easeInSine),
            ],
          ),
        );
      }),
    );
  }
}
