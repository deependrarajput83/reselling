import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/widget/imageedit.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/widget/productinfoedit.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/widget/productinfosecondedit.dart';

import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../hometextfile.dart';

class Producteditscreen extends StatelessWidget {
  const Producteditscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: AppTextFile.ProductEdit),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSize.spacingMd),
            ProductImageEdit(),
            SizedBox(height: AppSize.spacingMd),
            ProductInfoFirstpageedit(),
            SizedBox(height: AppSize.spacingMd),
            ProductInfoPagesecond(),
            SizedBox(height: AppSize.spacingXs),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton(
                widht: double.infinity,
                OnPressed: () {},
                child: Text(AppTextFile.Ubuttontext),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton(
                background: AppColor.secondarybuttoncolor,
                widht: double.infinity,
                OnPressed: () {},
                child: Text(AppTextFile.DeleteProduct),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
