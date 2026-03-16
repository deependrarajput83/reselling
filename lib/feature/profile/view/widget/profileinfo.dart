import 'package:flutter/material.dart';

import '../../../../core/commonfile/screensize.dart';
import '../../../../core/commonstyle/colorstyle.dart';
import '../../../../core/commonstyle/sizes.dart';
import '../../../../core/commonwidget/commoncontainer.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      padding: EdgeInsets.all(AppSize.paddingSm),
      height: Screensize.height(context) * 0.13,
      width: double.infinity,
      color: AppColor.ContainerColor,
      radius: 0,
      border: Border.all(color: Colors.grey.shade200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppSize.spacingXxxl,
            backgroundImage: AssetImage("assets/wirelessheadphone.png"),
          ),
          SizedBox(width: AppSize.spacingMd),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Jho luther",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                "jholuther239@gmail.com",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "+91983334448",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
