import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/productinfo.dart';

import '../../../../../core/commonfile/screensize.dart';
import '../../../../../core/commonstyle/sizes.dart';
import '../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../core/commonwidget/commonimagepicker.dart';
import '../../../../../core/commonwidget/commontabbar.dart';
import '../../../../../repo/apicalling.dart';
import '../../../hometextfile.dart';

class Stockfulldatascreen extends StatelessWidget {
  const Stockfulldatascreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Productrepo.getproduct();
    return Scaffold(
      appBar: CommonAppBar(
        showBack: true,
        title: AppTextFile.StockOverappbartext,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSize.paddingSm,
          right: AppSize.paddingSm,
        ),
        child: CommonTabBar(
          height: Screensize.height(context) * 0.06,
          tabs: [AppTextFile.Lstock, AppTextFile.OutStock, AppTextFile.Lock],
          views: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  AppTextFile.Lstock,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      final p = product[index];
                      return CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingSm),
                        margin: EdgeInsets.only(top: 5),
                        height: Screensize.height(context) * 0.12,
                        width: Screensize.weight(context) * double.infinity,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        child: Row(
                          children: [
                            CommonimagePicker(imagepath: p.image),
                            SizedBox(width: 13),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(p.money.toString()),
                                CommonContainer(
                                  width: Screensize.weight(context) * 0.18,
                                  height: Screensize.height(context) * 0.029,
                                  color: Colors.orange.shade100,
                                  radius: 5,
                                  child: Center(
                                    child: Text(
                                      "Stock:8",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            CommonButton(
                              widht: 20,
                              height: 35,
                              OnPressed: () {
                                final pro = product[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductInfo(productInformation: pro),
                                  ),
                                );
                              },
                              child: Text(AppTextFile.Ubuttontext),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  AppTextFile.Lstock,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      final p = product[index];
                      return CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingSm),
                        margin: EdgeInsets.only(top: 5),
                        height: Screensize.height(context) * 0.12,
                        width: Screensize.weight(context) * double.infinity,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        child: Row(
                          children: [
                            CommonimagePicker(imagepath: p.image),
                            SizedBox(width: 13),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(p.money.toString()),
                                CommonContainer(
                                  width: Screensize.weight(context) * 0.23,
                                  height: Screensize.height(context) * 0.029,
                                  color: Colors.orange.shade100,
                                  radius: 5,
                                  child: Center(
                                    child: Text(
                                      "Out of Stock",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            CommonButton(
                              widht: 20,
                              height: 35,
                              OnPressed: () {
                                final pro = product[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductInfo(productInformation: pro),
                                  ),
                                );
                              },
                              child: Text(AppTextFile.Ubuttontext),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  AppTextFile.Lstock,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingSm),
                        margin: EdgeInsets.only(top: 5),
                        height: Screensize.height(context) * 0.12,
                        width: Screensize.weight(context) * double.infinity,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        child: Row(
                          children: [
                            CommonimagePicker(imagepath: product[index].image),
                            SizedBox(width: 13),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Smart Firness Watch",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text("₹2499"),
                                CommonContainer(
                                  width: Screensize.weight(context) * 0.18,
                                  height: Screensize.height(context) * 0.029,
                                  color: Colors.orange.shade100,
                                  radius: 5,
                                  child: Center(
                                    child: Text(
                                      "Stock:80",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            CommonButton(
                              widht: 20,
                              height: 35,
                              OnPressed: () {
                                final pro = product[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductInfo(productInformation: pro),
                                  ),
                                );
                              },
                              child: Text(AppTextFile.Ubuttontext),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
