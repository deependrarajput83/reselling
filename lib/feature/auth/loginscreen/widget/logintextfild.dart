import 'package:flutter/material.dart';

import '../../../../core/commonfile/commonicon.dart';
import '../../../../core/commonstyle/sizes.dart';
import '../../../../core/commonwidget/commontextbutton.dart';
import '../../../../core/commonwidget/commontextformfiled.dart';

class LoginTextFiled extends StatelessWidget {
  const LoginTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final isDark = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.spacingMd),
        Text("Email", style: theme.textTheme.titleSmall),
        Commontextformfiled(
          hint: "Enter your email",
          controller: TextEditingController(),
          obscureText: false,
          prefixIcon: Commonicon.emailicon,
        ),
        SizedBox(height: AppSize.spacingMd),
        Text("Password", style: theme.textTheme.titleSmall),
        Commontextformfiled(
          maxLines: 1,
          controller: TextEditingController(),
          obscureText: true,
          hint: "Enter your password",
          prefixIcon: Commonicon.lock,
        ),
        SizedBox(height: AppSize.spacingMd),
        Align(
          alignment: AlignmentGeometry.topRight,
          child: CommonTextButton(ontap: () {}, child: Text("Forgot password")),
        ),
      ],
    );
  }
}
