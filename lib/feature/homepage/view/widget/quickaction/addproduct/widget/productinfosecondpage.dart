import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../core/commonwidget/commontextformfiled.dart';
import '../../../../../hometextfile.dart';
import '../../../../../viewmodel/datauplodeprovider.dart';

class ProductInfoSecondPage extends StatelessWidget {
  ProductInfoSecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Datauplodeprovider>();
    return CommonContainer(
      height: Screensize.height(context) * 0.27,
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
          ),
          SizedBox(height: AppSize.spacingSm),
          Text(AppTextFile.Tags),
          Commontextformfiled(
            Keywordtype: TextInputType.text,
            controller: provider.tagscontroller,
            obscureText: false,
            hint: "Trending,bestseller,new",
          ),
          SizedBox(height: AppSize.spacingSm),
          Row(
            children: [
              Text(AppTextFile.LockProduct),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Icon(Commonicon.unlock, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
