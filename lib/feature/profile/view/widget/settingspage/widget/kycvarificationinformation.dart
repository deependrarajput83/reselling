import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../homepage/hometextfile.dart';
import '../../../../viewmodel/kycprovider.dart';
import '../../../iconandtextlist.dart';
import 'kycdatafillpage.dart';

class Kycvarificationinformation extends StatefulWidget {
  final bool showMessage;
  const Kycvarificationinformation({super.key, this.showMessage = false});

  @override
  State<Kycvarificationinformation> createState() =>
      _KycvarificationinformationState();
}

class _KycvarificationinformationState
    extends State<Kycvarificationinformation> {
  @override
  void initState() {
    super.initState();
    if (widget.showMessage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("KYC verification completed")),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<Kycprovider>(context);
    final list = providerdata.getKycModels().toList();
    if (providerdata.KycData.isEmpty) {
      return const Kycdatafillpage();
    }
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: AppTextFile.KycVari),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSize.spacingSm);
        },
        itemBuilder: (context, index) {
          final data = list.isNotEmpty ? list.first : null;
          return index == 0
              ? ListTile(
                  contentPadding: EdgeInsets.all(AppSize.paddingSm),
                  tileColor: AppColor.secondary,
                  title: Row(
                    children: [
                      Icon(
                        Iconandtextlist.kycDataList[index]['iconfirst'],
                        color: AppColor.Whitecolor,
                        size: AppSize.IconXXL,
                      ),
                      SizedBox(width: AppSize.spacingMd),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Iconandtextlist.kycDataList[index]['KycVerified'],
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            AppTextFile.kycsuccess,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : index == 4
              ? ListTile(
                  contentPadding: EdgeInsets.all(AppSize.paddingSm),
                  tileColor: Colors.blue.shade100,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppTextFile.Warning,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "KYC verification is mandatory to comply with financial regulations and to ensure secure transactions. it helps us protect your account and prevent fraud. ",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                )
              : CommonContainer(
                  padding: EdgeInsets.all(AppSize.paddingSm),
                  //height: Screensize.height(context) * 0.16,
                  radius: 0,
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Iconandtextlist.kycDataList[index]['iconfirst']),
                          SizedBox(width: AppSize.spacingSm),
                          Text(Iconandtextlist.kycDataList[index]['docoinfo']),
                          Spacer(),
                          Icon(
                            Iconandtextlist.kycDataList[index]['Iconsecond'],
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.spacingLg),
                      CommonContainer(
                        radius: 4,
                        color: Colors.grey.shade200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  Iconandtextlist.kycDataList[index]['Account'],
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Expanded(
                                  child: Text(
                                    index == 1
                                        ? (data != null
                                              ? data.pan
                                              : "Not added")
                                        : index == 2
                                        ? (data != null
                                              ? data.aadhar
                                              : "Not added")
                                        : index == 3
                                        ? (data != null
                                              ? data.bankAccount
                                              : "Not added")
                                        : "",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Status:",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  Iconandtextlist.kycDataList[index]['Status'],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
