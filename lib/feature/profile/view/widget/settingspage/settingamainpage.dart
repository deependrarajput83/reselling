import 'package:flutter/material.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/bankaccount/bankacmainscreen.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/help&support/helpndsupport.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/settings/settings.dart';

import '../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../homepage/hometextfile.dart';
import '../../iconandtextlist.dart';
import 'widget/kycvarificationinformation.dart';

class SettingAllInfo extends StatelessWidget {
  const SettingAllInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color: Colors.white,
      radius: 0,
      border: Border.all(color: Colors.grey.shade200),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: Iconandtextlist.Profiledata.length,
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey.shade200, height: 1);
        },
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Kycvarificationinformation(),
                  ),
                );
              }
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BankAcMainScreen()),
                );
              }
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              }
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpNdSupport()),
                );
              }
            },
            leading: Icon(
              Iconandtextlist.Profiledata[index]['icon'],
              size: 20,
              color: homeiconcolor.iconscolor[index],
            ),
            title: Text(
              Iconandtextlist.Profiledata[index]['text'],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Icon(
              Iconandtextlist.Profiledata[index]['IconTwo'],
              size: 20,
            ),
          );
        },
      ),
    );
  }
}
