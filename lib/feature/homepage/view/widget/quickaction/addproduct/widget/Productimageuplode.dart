import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../hometextfile.dart';

class ProductImageUpload extends StatelessWidget {
  const ProductImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      padding: EdgeInsets.all(AppSize.paddingMd),
      radius: 0,
      height: Screensize.height(context) * 0.19,
      width: Screensize.weight(context) * double.infinity,
      color: AppColor.ContainerColor,
      border: Border.all(color: Colors.grey.shade300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTextFile.ProductImage,
            style: TextStyle(fontFamily: "poppins"),
          ),
          SizedBox(height: AppSize.spacingSm),
          DottedBorder(
            strokeWidth: 2,
            color: Colors.grey,
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            dashPattern: [6, 4],
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return CommonContainer(
                      height: Screensize.height(context) * 0.14,
                      width: Screensize.weight(context) * double.infinity,
                      color: AppColor.ContainerColor,
                      padding: EdgeInsets.all(AppSize.paddingXl),
                      radius: 2,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Commonicon.camraicon, size: AppSize.IconXL),
                              Text(
                                AppTextFile.Camera,
                                style: TextStyle(fontFamily: "poppins"),
                              ),
                            ],
                          ),
                          SizedBox(width: AppSize.spacingXxl),
                          Column(
                            children: [
                              Icon(
                                Commonicon.galleryicon,
                                size: AppSize.IconXL,
                              ),
                              Text(
                                AppTextFile.Gallery,
                                style: TextStyle(fontFamily: "poppins"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CommonContainer(
                height: Screensize.height(context) * 0.11,
                width: Screensize.weight(context) * 0.29,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Commonicon.fileupload, size: AppSize.IconXL),
                    Text(
                      "Upload",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
