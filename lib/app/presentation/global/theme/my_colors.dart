import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFF9066C);
  static const Color primaryColor2 = Color.fromARGB(255, 185, 28, 81);
  static const Color secondary = Color(0xFFFF407D);
  static const Color lightGrey = Color(0xFFCAC8C8);
  static const Color gray = Color(0xFF8B8B8B);
  static const Color blue = Color(0xFF0042D6);
  static const Color green1 = Color(0xFF00B652);

  //APPBAR
  static const Color appBarColor = primaryColor;

  //SCAFFOLD
  static const gradientBG = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.repeated,
    colors: [
      AppColors.primaryColor,
      Color.fromARGB(255, 190, 25, 82),
    ],
  );
  static const Color scaffoldBackgroundColor = Color(0xfffafafa);
  static const Color dividerColor = primaryColor;
  static const Color cardColor = Color(0xfffafafa);

  //ICONS
  static const Color appBarIconsColor = Colors.white;
  static const Color iconColor = Color(0xFF899A96);

  //BUTTON
  static const Color buttonColor = Color.fromARGB(255, 232, 20, 119);
  static const Color buttonTextColor = Colors.white;
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Color(0xFF181D30);

  //TEXT
  static const Color h3 = Color(0xFF30444E);
  static const Color h1 = Color(0xFF181D30);
  static const Color h2 = Color(0xFF30444E);
  static const Color h4 = Color.fromARGB(215, 104, 104, 104);

  //chip
  static const Color chipBackground = primaryColor;
  static const Color chipTextColor = Colors.white;
  static const Color success = Color(0xFF22FE4E);
  static const Color error = Color(0xFFEE2D24);
}
