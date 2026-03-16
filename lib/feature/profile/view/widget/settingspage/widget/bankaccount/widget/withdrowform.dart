import 'package:flutter/material.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/bankaccount/widget/withdrowfromwidget.dart';

import '../../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../homepage/hometextfile.dart';

class WithDrowForm extends StatelessWidget {
  const WithDrowForm({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: double.infinity,
      color: AppColor.Whitecolor,
      padding: EdgeInsets.all(AppSize.paddingSm),
      border: Border.all(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTextFile.Requestpayout,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: AppSize.spacingMd),
          Text(
            AppTextFile.Amount,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Withdrowfromwidget(),
        ],
      ),
    );
  }
}
