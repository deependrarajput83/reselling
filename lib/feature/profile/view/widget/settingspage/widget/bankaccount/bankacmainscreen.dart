import 'package:flutter/material.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/bankaccount/widget/balanceinformation.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/bankaccount/widget/payouthistory.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/bankaccount/widget/withdrowform.dart';

import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../homepage/hometextfile.dart';

class BankAcMainScreen extends StatelessWidget {
  const BankAcMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: AppTextFile.payout),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceInformation(),
            SizedBox(height: Screensize.height(context) * 0.01),
            WithDrowForm(),
            SizedBox(height: Screensize.height(context) * 0.01),
            PayOutHistory(),
            SizedBox(height: Screensize.height(context) * 0.02),
          ],
        ),
      ),
    );
  }
}
