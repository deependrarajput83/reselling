import 'package:flutter/material.dart';

import '../colorstyle.dart';
import '../sizes.dart';

class AppInputTheme {
  AppInputTheme._();
  static InputDecorationTheme light = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: AppSize.paddingMd,
      horizontal: AppSize.paddingMd,
    ),
    filled: true,
    fillColor: AppColor.lightmode,
    hintStyle: TextStyle(
      fontFamily: "Poppins",
      color: AppColor.lightmodetext.withOpacity(0.6),
      fontSize: AppSize.fontMd,
    ),
    labelStyle: TextStyle(
      fontFamily: "Poppins",
      color: AppColor.lightmodetext,
      fontSize: AppSize.fontMd,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: AppColor.redcolor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: AppColor.redcolor, width: 2.0),
    ),
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
  );

  static InputDecorationTheme dark = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: AppSize.paddingMd,
      horizontal: AppSize.paddingMd,
    ),
    filled: true,
    fillColor: AppColor.lightmode.withOpacity(0.1),
    hintStyle: TextStyle(
      fontFamily: "Poppins",
      color: AppColor.darkmodetext.withOpacity(0.7),
      fontSize: AppSize.fontMd,
    ),
    labelStyle: TextStyle(
      fontFamily: "Poppins",
      color: AppColor.darkmodetext,
      fontSize: AppSize.fontMd,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: AppColor.redcolor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMd),
      borderSide: BorderSide(color: AppColor.redcolor, width: 2.0),
    ),
    suffixIconColor: AppColor.lightmode,
    prefixIconColor: AppColor.lightmode,
  );
}
