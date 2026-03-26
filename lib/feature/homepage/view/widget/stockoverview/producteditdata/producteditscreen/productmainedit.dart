import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/widget/imageedit.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/widget/productinfoedit.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/widget/productinfosecondedit.dart';

import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../../../model/productmodel/userproductmodel.dart';
import '../../../../../hometextfile.dart';
import '../../../../../viewmodel/datauplodeprovider.dart';

class Producteditscreen extends StatefulWidget {
  final UserProductModel product;
  Producteditscreen({super.key, required this.product});

  @override
  State<Producteditscreen> createState() => _ProducteditscreenState();
}

class _ProducteditscreenState extends State<Producteditscreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<Datauplodeprovider>().loadProductFromModel(widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<Datauplodeprovider>();
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: AppTextFile.ProductEdit),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSize.spacingMd),
            ProductImageedit(),
            SizedBox(height: AppSize.spacingMd),
            ProductInfoFirstpageedit(
              namecontroller: data.namecontroller,
              pricecontroller: data.pricecontroller,
              stockcontroller: data.stockcontroller,
              mrpcontroller: data.mrpcontroller,
              categorycontroller: data.mrpcontroller,
              descriptioncontroller: data.descriptioncontroller,
            ),
            SizedBox(height: AppSize.spacingMd),
            ProductInfoPagesecond(
              weight: data.weightcontroller,
              tags: data.tagscontroller,
            ),
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
