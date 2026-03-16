import 'package:flutter/material.dart';

import '../../../../core/commonfile/commonicon.dart';
import '../../../../core/commonfile/screensize.dart';
import '../../../../core/commonstyle/colorstyle.dart';
import '../../../../core/commonstyle/sizes.dart';
import '../../../../core/commonwidget/commoncontainer.dart';
import '../../../homepage/hometextfile.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      height: Screensize.height(context) * 0.18,
      color: AppColor.ContainerColor,
      radius: 0,
      padding: EdgeInsets.all(AppSize.paddingSm),
      border: Border.all(color: Colors.grey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Commonicon.StoreIcon, color: AppColor.secondary),
              SizedBox(width: AppSize.spacingSm),
              Text(
                AppTextFile.Storeinfo,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          SizedBox(height: AppSize.spacingSm),
          Row(
            children: [
              Text(
                AppTextFile.Storename,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Spacer(),
              Text(
                "ResellerHub Store",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: AppSize.spacingSm),
          Row(
            children: [
              Text(
                AppTextFile.Member,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Spacer(),
              Text(
                "Jan 2024",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: AppSize.spacingSm),
          Row(
            children: [
              Text(
                AppTextFile.KycStatus,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Spacer(),
              Text(
                "ResellerHub Store",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
