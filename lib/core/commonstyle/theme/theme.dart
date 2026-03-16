import 'package:flutter/material.dart';
import 'package:reselling_new/core/commonstyle/theme/textbuttontheme.dart';
import 'package:reselling_new/core/commonstyle/theme/textformfild.dart';
import 'package:reselling_new/core/commonstyle/theme/texttheme.dart';

import '../colorstyle.dart';
import 'appbartheme.dart';
import 'buttontheme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lighttheme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: true,
    primaryColor: AppColor.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.lightmode,
    disabledColor: Colors.grey.shade300,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: AppInputTheme.light,
    appBarTheme: Appbartheme.LightMode,
    elevatedButtonTheme: AppButtonTheme.LightMode,
    textButtonTheme: Textbuttontheme.lightmodebutton,
  );
  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.darkmode,
    brightness: Brightness.dark,
    disabledColor: Colors.grey.shade300,
    textTheme: AppTextTheme.darktexttheme,
    inputDecorationTheme: AppInputTheme.dark,
    appBarTheme: Appbartheme.DarkMode,
    elevatedButtonTheme: AppButtonTheme.Darkmode,
    textButtonTheme: Textbuttontheme.darkmodebutton,
  );
}
