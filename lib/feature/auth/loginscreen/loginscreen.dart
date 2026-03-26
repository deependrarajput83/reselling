import 'package:flutter/material.dart';
import 'package:reselling_new/feature/auth/loginscreen/widget/applogo.dart';
import 'package:reselling_new/feature/auth/loginscreen/widget/loginbutton.dart';
import 'package:reselling_new/feature/auth/loginscreen/widget/logintextfild.dart';

import '../../../core/commonstyle/colorstyle.dart';
import '../../../core/commonstyle/sizes.dart';
import '../../../core/commonwidget/commontextbutton.dart';
import '../authtextfile.dart';
import '../signupbutton.dart';
import '../signupscreen/signupmainscreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.lightmode,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.paddingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const AppLogo(),
                const SizedBox(height: 30),
                Text(
                  "Welcome Back",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Login to manage your business",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.ContainerColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const LoginTextFiled(),
                ),
                const SizedBox(height: 25),
                const LoginButton(),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const SizedBox(width: 10),
                    Text("Or continue with", style: theme.textTheme.bodySmall),
                    const SizedBox(width: 10),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),
                const SignUpButton(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Authtextfile.Alreadyaccount),
                    CommonTextButton(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupMainScreen()),
                        );
                      },
                      child: const Text(" Sign up"),
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
