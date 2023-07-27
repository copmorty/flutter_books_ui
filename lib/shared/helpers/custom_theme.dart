import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

class CustomTheme {
  static ThemeData light = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: blackColor,
      onPrimary: whiteColor,
      secondary: greyishColor,
      onSecondary: whiteColor,
      error: redColor,
      onError: whiteColor,
      background: greyishColor,
      onBackground: whiteColor,
      surface: greyishColor,
      onSurface: whiteColor,
    ),
    scaffoldBackgroundColor: whiteColor,
  );
}
