import 'package:flutter/material.dart';

import '../../../../core/commonwidget/commonbutton.dart';
import '../../../homepage/view/homemainpage.dart';
import '../../authtextfile.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonButton(
      widht: double.infinity,
      OnPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeMainPage(isActive: true)),
        );
      },
      child: Text(
        Authtextfile.login,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
