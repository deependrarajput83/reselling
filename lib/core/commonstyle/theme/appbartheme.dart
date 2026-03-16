import 'package:flutter/material.dart';
import 'package:reselling_new/core/commonstyle/theme/texttheme.dart';

import '../colorstyle.dart';
import '../sizes.dart';

class Appbartheme {
  Appbartheme._();
  static AppBarTheme LightMode = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    toolbarHeight: AppSize.Appbar,
    backgroundColor: AppColor.primary,
    titleTextStyle: AppTextTheme.darktexttheme.titleLarge,
    iconTheme: IconThemeData(
      color: AppColor.lightmodetext,
      size: AppSize.IconXL,
    ),
  );
  static AppBarTheme DarkMode = AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.primary,
    centerTitle: true,
    toolbarHeight: AppSize.Appbar,
    titleTextStyle: AppTextTheme.darktexttheme.titleLarge,
    iconTheme: IconThemeData(
      color: AppColor.lightmodetext,
      size: AppSize.IconXL,
    ),
  );
}
