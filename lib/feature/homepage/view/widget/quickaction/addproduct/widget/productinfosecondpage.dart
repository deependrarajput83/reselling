import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../core/commonwidget/commontextformfiled.dart';
import '../../../../../hometextfile.dart';
import '../../../../../viewmodel/datauplodeprovider.dart';

class ProductInfoSecondPage extends StatefulWidget {
  ProductInfoSecondPage({super.key});

  @override
  State<ProductInfoSecondPage> createState() => _ProductInfoSecondPageState();
}

class _ProductInfoSecondPageState extends State<ProductInfoSecondPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Datauplodeprovider>();
    return CommonContainer(
      ///height: Screensize.height(context) * 0.27,
      width: Screensize.weight(context) * double.infinity,
      color: AppColor.ContainerColor,
      padding: EdgeInsets.all(AppSize.paddingSm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTextFile.Weight),
          Commontextformfiled(
            Keywordtype: TextInputType.number,
            controller: provider.weightcontroller,
            obscureText: false,
            hint: "100g",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Weight required";
              }
              if (double.tryParse(value) == null) {
                return "Invalid number";
              }
              return null;
            },
          ),
          SizedBox(height: AppSize.spacingSm),
          Text(AppTextFile.Tags),
          Commontextformfiled(
            Keywordtype: TextInputType.text,
            controller: provider.tagscontroller,
            obscureText: false,
            hint: "Trending,bestseller,new",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Tags required";
              }
              return null;
            },
          ),
          SizedBox(height: AppSize.spacingSm),

          Row(
            children: [
              Text("Lock Product"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.read<Datauplodeprovider>().toggleLock();
                },
                child: context.watch<Datauplodeprovider>().isLock
                    ? Icon(Icons.lock)
                    : Icon(Icons.lock_open),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
