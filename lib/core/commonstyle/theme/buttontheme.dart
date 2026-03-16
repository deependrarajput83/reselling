import 'package:flutter/material.dart';

import '../colorstyle.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static ElevatedButtonThemeData LightMode = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        AppColor.primarybuttoncolor,
      ),
      foregroundColor: WidgetStatePropertyAll(AppColor.lightmode),
      elevation: WidgetStateProperty.all<double?>(8.2),
    ),
  );
  static ElevatedButtonThemeData Darkmode = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        AppColor.primarybuttoncolor,
      ),
      foregroundColor: WidgetStatePropertyAll<Color>(AppColor.darkmodetext),
      elevation: WidgetStateProperty.all<double?>(8.2),
    ),
  );
}
