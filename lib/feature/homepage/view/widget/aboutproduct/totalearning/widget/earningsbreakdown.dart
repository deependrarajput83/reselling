import 'package:flutter/material.dart';

import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../hometextfile.dart';

class EarningsBreakDown extends StatelessWidget {
  EarningsBreakDown({super.key});
  List<String> text = [
    AppTextFile.PSales,
    AppTextFile.Deliverycharge,
    AppTextFile.Refund,
    AppTextFile.NetEarn,
  ];
  List<String> money = ["₹2,89,500", "₹18,500", "₹12,450", "₹2,95,100"];
  static const List<Color> lightBgColors = [
    Color(0xFFE6D9FF),
    Color(0xFFD6E6FF),
    Color(0xFFD9F2E6),
    Color(0xFFFFE2CC),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      height: Screensize.height(context) * 0.3,
      width: Screensize.weight(context) * double.infinity,
      padding: EdgeInsets.all(AppSize.paddingSm),
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTextFile.EBreakdown),
          Column(
            children: List.generate(4, (index) {
              return CommonContainer(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(AppSize.paddingSm),
                color: lightBgColors[index],
                height: Screensize.height(context) * 0.05,
                width: Screensize.weight(context) * double.infinity,
                child: Row(
                  children: [
                    Text(text[index]),
                    Spacer(),
                    Text(
                      money[index],
                      style: TextStyle(color: homeiconcolor.iconscolor[index]),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
