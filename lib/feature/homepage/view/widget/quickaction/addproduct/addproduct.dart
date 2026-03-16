import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/addproduct/widget/Productimageuplode.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/addproduct/widget/Productinfofirstpage.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/addproduct/widget/productinfosecondpage.dart';

import '../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../hometextfile.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: AppTextFile.AP),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSize.spacingMd),
            ProductImageUpload(),
            SizedBox(height: AppSize.spacingMd),
            ProductInfoFirstPage(),
            SizedBox(height: AppSize.spacingMd),
            ProductInfoSecondPage(),
            SizedBox(height: AppSize.spacingXs),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton(OnPressed: () {}, child: Text("Add Product")),
            ),
          ],
        ),
      ),
    );
  }
}
