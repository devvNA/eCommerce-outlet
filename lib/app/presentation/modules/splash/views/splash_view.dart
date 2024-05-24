import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_colors.dart';

import '../../../../core/utils/helpers/constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    var theme = context.theme;

    return Scaffold(
      body: GetBuilder<SplashController>(builder: (value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",
                child: Image.asset(
                  Constants.logo,
                  width: 100,
                ).animate().fade().slideY(
                    duration: const Duration(milliseconds: 500),
                    begin: 2,
                    curve: Curves.easeInSine),
              ),
              16.verticalSpace,
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'MV ',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Shop',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: Colors.black,
                    ),
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
