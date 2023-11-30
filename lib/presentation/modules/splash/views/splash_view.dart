import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
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
                width: 120,
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 1,
                  curve: Curves.easeInSine),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'MV',
                    style: theme.textTheme.displayMedium
                        ?.copyWith(color: theme.primaryColor),
                  ),
                  TextSpan(
                    text: ' Shop',
                    style: theme.textTheme.displayMedium,
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
