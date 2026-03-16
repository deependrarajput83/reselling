import 'package:flutter/material.dart';

import '../colorstyle.dart';
import '../sizes.dart';

class Textbuttontheme {
  Textbuttontheme._();
  static TextButtonThemeData lightmodebutton = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.primary,
      textStyle: const TextStyle(
        fontSize: AppSize.fontMd,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
      padding: EdgeInsetsGeometry.all(0),
    ),
  );
  static TextButtonThemeData darkmodebutton = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.secondarybuttoncolor,
      textStyle: const TextStyle(
        fontSize: AppSize.fontMd,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      ),
      padding: EdgeInsetsGeometry.all(0),
    ),
  );
}
