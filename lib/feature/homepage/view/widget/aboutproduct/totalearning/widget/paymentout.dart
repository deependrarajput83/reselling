import 'package:flutter/material.dart';

import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../hometextfile.dart';

class PaymentOut extends StatelessWidget {
  const PaymentOut({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      height: Screensize.height(context) * 0.2,
      width: Screensize.weight(context) * double.infinity,
      padding: EdgeInsets.all(AppSize.paddingMd),
      color: Color(0xF22e6c2),
      border: Border.all(color: Colors.grey.shade300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTextFile.CurrentBalance),
          SizedBox(height: 20),
          Text("₹150,000", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 20),
          CommonButton(
            OnPressed: () {},
            widht: 20,
            child: Text(
              "Request Payout",
              style: TextStyle(color: AppColor.whitebutton),
            ),
          ),
        ],
      ),
    );
  }
}
