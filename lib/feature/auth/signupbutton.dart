import 'package:flutter/material.dart';

import '../../core/commonfile/commonicon.dart';
import '../../core/commonstyle/colorstyle.dart';
import '../../core/commonstyle/sizes.dart';
import '../../core/commonwidget/commonbutton.dart';
import 'signupscreen/signupmainscreen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return CommonButton(
      widht: double.infinity,
      OnPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignupMainScreen()),
        );
      },
      background: AppColor.whitebutton,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.grey, width: 0.8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Commonicon.google),
          SizedBox(width: AppSize.spacingSm),
          Text("Continue with Google"),
        ],
      ),
    );
  }
}
