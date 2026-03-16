import 'package:flutter/material.dart';

import '../../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../homepage/hometextfile.dart';

class BalanceInformation extends StatelessWidget {
  const BalanceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonContainer(
          radius: 0,
          color: Colors.white,
          padding: EdgeInsets.all(AppSize.paddingSm),
          boxShadow: BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Commonicon.Wallat,
                      color: Colors.green,
                      size: AppSize.IconLG,
                    ),
                  ),
                  SizedBox(width: AppSize.spacingMd),
                  Text(
                    AppTextFile.Availablebalance,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.spacingSm),
              Row(
                children: [
                  Text(
                    " ₹",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: AppSize.spacingXs),
                  Text(
                    "125,500",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.spacingSm),
              Text(
                "This amount is available for withdrawal",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
