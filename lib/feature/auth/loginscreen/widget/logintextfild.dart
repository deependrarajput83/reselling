import 'package:flutter/material.dart';

import '../../../../core/commonfile/commonicon.dart';
import '../../../../core/commonstyle/sizes.dart';
import '../../../../core/commonwidget/commontextbutton.dart';
import '../../../../core/commonwidget/commontextformfiled.dart';
import '../../forgotpasswordscreen/forgetpasswordscreen.dart';

class LoginTextFiled extends StatefulWidget {
  const LoginTextFiled({super.key});

  @override
  State<LoginTextFiled> createState() => _LoginTextFiledState();
}

class _LoginTextFiledState extends State<LoginTextFiled> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final isDark = theme.brightness == Brightness.dark;
    return Form(
      key: _formKey,
      child: Column(
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
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
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
            child: CommonTextButton(
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                }
              },
              child: Text("Forgot password"),
            ),
          ),
        ],
      ),
    );
  }
}
