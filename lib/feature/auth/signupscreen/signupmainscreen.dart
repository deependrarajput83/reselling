import 'package:flutter/material.dart';
import 'package:reselling_new/feature/auth/signupscreen/widget/signuptextformfild.dart';

import '../../../core/commonstyle/sizes.dart';
import '../../../core/commonwidget/commonbutton.dart';
import '../../../core/commonwidget/commontextbutton.dart';
import '../authtextfile.dart';
import '../loginscreen/loginscreen.dart';
import '../loginscreen/widget/applogo.dart';
import '../signupbutton.dart';

class SignupMainScreen extends StatelessWidget {
  const SignupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSize.paddingMd),
        child: Center(
          child: SafeArea(
            top: true,
            bottom: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLogo(),
                  SizedBox(height: AppSize.spacingXl),
                  Text("Create Account"),
                  SizedBox(height: AppSize.spacingSm),
                  Text("Start your reselling journey with resell"),
                  SignupTextFormFiled(),
                  SizedBox(height: AppSize.spacingXl),
                  CommonButton(OnPressed: () {}, child: Text("Sign up")),
                  SizedBox(height: AppSize.spacingLg),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: AppSize.spacingLg),
                      Text(Authtextfile.signuptextoption),
                      SizedBox(width: AppSize.spacingLg),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: AppSize.spacingLg),
                  SignUpButton(),
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
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
