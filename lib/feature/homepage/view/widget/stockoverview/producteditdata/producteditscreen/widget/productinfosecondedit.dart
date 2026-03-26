import 'package:flutter/material.dart';

import '../../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../../core/commonwidget/commontextformfiled.dart';
import '../../../../../../hometextfile.dart';

class ProductInfoPagesecond extends StatelessWidget {
  final TextEditingController weight;
  final TextEditingController tags;
  ProductInfoPagesecond({super.key, required this.weight, required this.tags});
  @override
  Widget build(BuildContext context) {
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
            controller: weight,
            obscureText: false,
            hint: "100g",
          ),
          SizedBox(height: AppSize.spacingSm),
          Text(AppTextFile.Tags),
          Commontextformfiled(
            controller: tags,
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
