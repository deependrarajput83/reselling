import 'dart:core';

import 'package:flutter/material.dart';

import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../core/commonwidget/commontextformfiled.dart';
import '../../../../../hometextfile.dart';

class ProductInfoFirstPage extends StatefulWidget {
  ProductInfoFirstPage({super.key});
  @override
  State<ProductInfoFirstPage> createState() => _ProductInfoFirstPageState();
}

class _ProductInfoFirstPageState extends State<ProductInfoFirstPage> {
  List<String> Cname = ["Electric", "Charger", "Cloth", "Fashion"];
  String? selectedCat = "Electric";
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      height: Screensize.height(context) * 0.55,
      padding: EdgeInsets.all(AppSize.paddingMd),
      width: double.infinity,
      color: AppColor.ContainerColor,
      border: Border.all(color: Colors.grey.shade300),
      radius: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTextFile.Productname,
            style: TextStyle(fontFamily: 'poppins'),
          ),
          SizedBox(height: AppSize.paddingSm),
          Commontextformfiled(
            controller: TextEditingController(),
            obscureText: false,
            hint: AppTextFile.EnterProductName,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.paddingSm),
            child: GridView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 2.2,
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppTextFile.Price),
                    SizedBox(height: AppSize.paddingXS),
                    Commontextformfiled(
                      maxLines: 1,
                      controller: TextEditingController(),
                      obscureText: false,
                      hint: AppTextFile.Price,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppTextFile.MRP),
                    SizedBox(height: AppSize.paddingXS),
                    Commontextformfiled(
                      maxLines: 1,
                      controller: TextEditingController(),
                      obscureText: false,
                      hint: AppTextFile.MRP,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppTextFile.StockQuantity),
                    SizedBox(height: AppSize.paddingXS),
                    Commontextformfiled(
                      maxLines: 1,
                      controller: TextEditingController(),
                      obscureText: false,
                      hint: AppTextFile.StockQuantity,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppTextFile.Category),
                    SizedBox(height: AppSize.paddingXS),
                    DropdownButtonFormField(
                      decoration: InputDecoration(fillColor: Colors.white),
                      dropdownColor: Colors.white,
                      isDense: true,
                      focusColor: Colors.white,
                      style: Theme.of(context).textTheme.titleSmall,
                      value: selectedCat,
                      menuMaxHeight: 300,
                      items: Cname.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(fontFamily: 'poppins'),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCat = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(AppTextFile.Description),
          SizedBox(height: AppSize.paddingXS),
          Commontextformfiled(
            controller: TextEditingController(),
            obscureText: false,
            minLines: 5,
            hint: AppTextFile.AddPlabel,
          ),
        ],
      ),
    );
  }
}
