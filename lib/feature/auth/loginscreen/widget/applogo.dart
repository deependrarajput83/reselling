import 'package:flutter/material.dart';

import '../../../../core/commonfile/commonicon.dart';
import '../../../../core/commonfile/screensize.dart';
import '../../../../core/commonstyle/colorstyle.dart';
import '../../../../core/commonwidget/commoncontainer.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color: AppColor.primary,
      height: Screensize.height(context) * 0.1,
      width: Screensize.weight(context) * 0.24,
      child: Icon(Commonicon.shoppingbagicon),
    );
  }
}
