import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/addproduct/widget/Productimageuplode.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/addproduct/widget/Productinfofirstpage.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/addproduct/widget/productinfosecondpage.dart';

import '../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../hometextfile.dart';
import '../../../../viewmodel/datauplodeprovider.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: AppTextFile.AP),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                child: CommonButton(
                  OnPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<Datauplodeprovider>().addproductdata();
                      Navigator.pop(context);
                    }
                    print(
                      "Name: ${context.read<Datauplodeprovider>().namecontroller.text}",
                    );
                    print(
                      "Price: ${context.read<Datauplodeprovider>().pricecontroller.text}",
                    );

                    print(
                      "Data add ${context.read<Datauplodeprovider>().tempdata}",
                    );
                  },
                  child: Text("Add Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
