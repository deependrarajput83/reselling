import 'package:flutter/material.dart';

import '../../../../core/commonstyle/sizes.dart';
import '../../../../core/commonwidget/commontextformfiled.dart';
import '../../authlistfile.dart';

class SignupTextFormFiled extends StatelessWidget {
  const SignupTextFormFiled({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSize.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(Authlistfile.fields[index]["fieldName"]),
              SizedBox(height: AppSize.spacingXs),
              Commontextformfiled(
                controller: TextEditingController(),
                obscureText: false,
                hint: Authlistfile.fields[index]["hintText"],
                prefixIcon: Authlistfile.fields[index]["icon"],
              ),
            ],
          ),
        );
      },
    );
  }
}
