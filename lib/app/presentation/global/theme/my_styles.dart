import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_colors.dart';
import 'my_fonts.dart';

class MyStyles {
  ///icons theme
  static IconThemeData getIconTheme() => const IconThemeData(
        color: AppColors.iconColor,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme() => AppBarTheme(
        elevation: 0,
        titleTextStyle: getTextTheme().bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: MyFonts.appBarTittleSize,
            ),
        iconTheme: const IconThemeData(color: AppColors.appBarIconsColor),
        backgroundColor: AppColors.appBarColor,
      );

  ///text theme
  static TextTheme getTextTheme() => TextTheme(
        labelLarge: MyFonts.buttonTextStyle.copyWith(
          fontSize: MyFonts.buttonTextSize,
        ),
        bodyLarge: (MyFonts.bodyTextStyle).copyWith(
          fontWeight: FontWeight.bold,
          fontSize: MyFonts.bodyLargeSize,
          color: AppColors.h2,
        ),
        bodyMedium: (MyFonts.bodyTextStyle).copyWith(
          fontSize: MyFonts.bodyMediumSize,
          color: AppColors.h2,
        ),
        displayLarge: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displayLargeSize,
          fontWeight: FontWeight.bold,
          color: AppColors.h3,
        ),
        bodySmall:
            TextStyle(color: AppColors.h4, fontSize: MyFonts.bodySmallTextSize),
        displayMedium: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.displayMediumSize,
            fontWeight: FontWeight.bold,
            color: AppColors.h4),
        displaySmall: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displaySmallSize,
          fontWeight: FontWeight.bold,
          color: AppColors.h1,
        ),
      );

  static ChipThemeData getChipTheme() {
    return ChipThemeData(
      backgroundColor: AppColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(),
      secondaryLabelStyle: getChipTextStyle(),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle() {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: AppColors.chipTextColor,
    );
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      {bool isBold = true, double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: AppColors.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: AppColors.buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return AppColors.buttonDisabledColor;
              }
              return AppColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );
}
