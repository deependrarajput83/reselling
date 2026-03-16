import 'package:flutter/material.dart';

import '../../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../homepage/hometextfile.dart';

class PayOutHistory extends StatelessWidget {
  const PayOutHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color: AppColor.Whitecolor,
      padding: EdgeInsets.all(AppSize.paddingSm),
      width: Screensize.weight(context) * double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTextFile.Payouthistory,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return CommonContainer(
                margin: EdgeInsets.only(top: Screensize.height(context) * 0.01),
                height: Screensize.height(context) * 0.1,
                width: double.infinity,
                color: Colors.grey.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Commonicon.Clickicon,
                          color: Colors.green,
                          size: 29,
                        ),
                        SizedBox(width: AppSize.spacingSm),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("₹45000"),
                            Text(
                              "Bank Transfer 2026-01-14",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        CommonContainer(
                          margin: EdgeInsets.all(AppSize.paddingSm),
                          height: Screensize.height(context) * 0.03,
                          width: Screensize.weight(context) * 0.2,
                          radius: 5,
                          color: Colors.green.shade500,
                          child: Center(
                            child: Text(
                              "Completed",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
