import 'package:flutter/material.dart';
import 'package:reselling_new/feature/auth/loginscreen/widget/applogo.dart';
import 'package:reselling_new/feature/auth/loginscreen/widget/loginbutton.dart';
import 'package:reselling_new/feature/auth/loginscreen/widget/logintextfild.dart';

import '../../../core/commonstyle/sizes.dart';
import '../../../core/commonwidget/commontextbutton.dart';
import '../authtextfile.dart';
import '../signupbutton.dart';
import '../signupscreen/signupmainscreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.paddingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogo(),
                SizedBox(height: AppSize.spacingXl),
                Text("Welcome Back"),
                SizedBox(height: AppSize.spacingSm),
                Text("Login to manage your business"),
                const LoginTextFiled(),
                SizedBox(height: AppSize.spacingXl),
                const LoginButton(),
                SizedBox(height: AppSize.spacingLg),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const SizedBox(width: AppSize.spacingLg),
                    Text("Or continue with"),
                    const SizedBox(width: AppSize.spacingLg),
                    const Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: AppSize.spacingLg),
                const SignUpButton(),
                SizedBox(height: AppSize.spacingLg),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Authtextfile.Alreadyaccount),
                    CommonTextButton(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupMainScreen(),
                          ),
                        );
                      },
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
