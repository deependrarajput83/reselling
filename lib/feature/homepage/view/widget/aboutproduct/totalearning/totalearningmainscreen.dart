import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/aboutproduct/totalearning/widget/allinfo.dart';
import 'package:reselling_new/feature/homepage/view/widget/aboutproduct/totalearning/widget/earningsbreakdown.dart';
import 'package:reselling_new/feature/homepage/view/widget/aboutproduct/totalearning/widget/paymentout.dart';

import '../../../../../../core/commonfile/screensize.dart';
import '../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../core/commonwidget/commonappbar.dart';

class TotalEarningMainScreen extends StatelessWidget {
  const TotalEarningMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: "Earnings"),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.paddingMd),
        child: Column(
          children: [
            PaymentOut(),
            SizedBox(height: Screensize.height(context) * 0.01),
            AllInfo(),
            SizedBox(height: Screensize.height(context) * 0.01),
            EarningsBreakDown(),
          ],
        ),
      ),
    );
  }
}
