import 'package:flutter/material.dart';

import '../colorstyle.dart';
import '../sizes.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "poppins",
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.bold,
      color: AppColor.lightmodetext,
    ),
    headlineMedium: TextStyle(
      fontSize: AppSize.fontLg,
      fontFamily: "poppins",
      fontWeight: FontWeight.w600,
      color: AppColor.lightmodetext,
    ),
    headlineSmall: TextStyle(
      fontSize: AppSize.fontLg,
      fontFamily: "poppins",
      fontWeight: FontWeight.w500,
      color: AppColor.lightmodetext,
    ),
    titleLarge: TextStyle(
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.w600,
      fontFamily: "poppins",
      color: AppColor.lightmodetext,
    ),
    titleMedium: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.lightmodetext,
    ),
    titleSmall: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.lightmodetext,
    ),
    bodyLarge: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.lightmodetext,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.lightmodetext.withOpacity(0.8),
    ),
    bodySmall: TextStyle(
      fontSize: AppSize.fontSm,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.lightmodetext.withOpacity(0.8),
    ),
    labelLarge: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w600,
      fontFamily: "poppins",
      color: AppColor.lightmodetext,
    ),
    labelMedium: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.lightmodetext,
    ),
    labelSmall: TextStyle(
      fontSize: AppSize.labelFont,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.lightmodetext.withOpacity(0.9),
    ),
  );
  static TextTheme darktexttheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.bold,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    headlineMedium: TextStyle(
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.w600,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    headlineSmall: TextStyle(
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    titleLarge: TextStyle(
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.w600,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    titleMedium: TextStyle(
      fontSize: AppSize.fontLg,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    titleSmall: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    bodyLarge: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.darkmodetext.withOpacity(0.9),
    ),
    bodySmall: TextStyle(
      fontSize: AppSize.fontSm,
      fontWeight: FontWeight.w400,
      fontFamily: "poppins",
      color: AppColor.darkmodetext.withOpacity(0.8),
    ),
    labelLarge: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w600,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    labelMedium: TextStyle(
      fontSize: AppSize.fontMd,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",
      color: AppColor.darkmodetext,
    ),
    labelSmall: TextStyle(
      fontSize: AppSize.fontSm,
      fontWeight: FontWeight.w500,
      fontFamily: "poppins",

      color: AppColor.darkmodetext.withOpacity(0.9),
    ),
  );
}
