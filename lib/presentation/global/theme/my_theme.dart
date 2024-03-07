import 'package:flutter/material.dart';
import 'my_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData() {
    return ThemeData(
      useMaterial3: false,
      // main color (app bar,tabs..etc)
      primaryColor: AppColors.primaryColor,
      // secondary color (for checkbox,float button, radio..etc)
      // secondary & background color
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.accentColor,
        backgroundColor: AppColors.backgroundColor,
        brightness: Brightness.light,
      ).copyWith(
        secondary: AppColors.accentColor,
      ),
      // color contrast (if the theme is dark text should be white for example)
      brightness: Brightness.light,
      // card widget background color
      cardColor: AppColors.cardColor,
      // hint text color
      hintColor: AppColors.hintTextColor,
      // divider color
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerColor,
      ),
      // app background color
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

      // progress bar theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
      ),

      // appBar theme
      appBarTheme: MyStyles.getAppBarTheme(),

      // elevated button theme
      elevatedButtonTheme: MyStyles.getElevatedButtonTheme(),

      // text theme
      textTheme: MyStyles.getTextTheme(),

      // chip theme
      chipTheme: MyStyles.getChipTheme(),

      // icon theme
      iconTheme: MyStyles.getIconTheme(),
    );
  }
}
