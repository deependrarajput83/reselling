import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/producteditdata/producteditscreen/productmainedit.dart';

import '../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../core/commonfile/screensize.dart';
import '../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../core/commonwidget/commonimagepicker.dart';
import '../../../../../../model/productmodel/userproductmodel.dart';
import '../../../../hometextfile.dart';

class ProductInfo extends StatefulWidget {
  final UserProductModel productInformation;
  const ProductInfo({super.key, required this.productInformation});
  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    bool outstock = widget.productInformation.itemcount == 0;
    bool lowstock =
        widget.productInformation.itemcount > 0 &&
        widget.productInformation.itemcount <= 10;
    print("Build count $currentindex");
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: "Product Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index, _) => Container(
                width: double.infinity,
                color: Colors.red,
                child: CommonimagePicker(
                  imagepath: widget.productInformation.image,
                  radius: BorderRadius.circular(0),
                ),
              ),
              options: CarouselOptions(
                height: 300,
                aspectRatio: 34 / 5,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: AppSize.spacingSm),
            DotsIndicator(dotsCount: 3, position: currentindex.toDouble()),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                final fulldata = widget.productInformation;
                return index == 0
                    ? CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingMd),
                        height: Screensize.height(context) * 0.14,
                        width: double.infinity,
                        radius: 0,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                        boxShadow: BoxShadow(offset: Offset(0.1, 0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fulldata.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: AppSize.spacingXs),
                            Row(
                              children: [
                                Text(
                                  fulldata.money.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: AppColor.primary),
                                ),
                                SizedBox(width: AppSize.spacingSm),
                                Text(
                                  fulldata.offprice.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                                SizedBox(width: AppSize.spacingSm),
                                CommonContainer(
                                  height: Screensize.height(context) * 0.025,
                                  width: Screensize.weight(context) * 0.16,
                                  radius: 3,
                                  color: Colors.green.shade100,
                                  child: Center(
                                    child: Text(
                                      "59% OFF",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: AppColor.secondary),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.spacingXs),
                            outstock
                                ? CommonContainer(
                                    radius: 3,
                                    color: AppColor.redcolor,
                                    height: Screensize.height(context) * 0.028,
                                    width: Screensize.weight(context) * 0.27,
                                    child: Center(
                                      child: Text(
                                        "Out of stock",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                  )
                                : lowstock
                                ? CommonContainer(
                                    radius: 3,
                                    color: Colors.orange.shade200,
                                    height: Screensize.height(context) * 0.028,
                                    width: Screensize.weight(context) * 0.27,
                                    child: Center(
                                      child: Text(
                                        "Low stock:-${widget.productInformation.itemcount}",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                  )
                                : CommonContainer(
                                    radius: 3,
                                    color: AppColor.secondary,
                                    height: Screensize.height(context) * 0.028,
                                    width: Screensize.weight(context) * 0.27,
                                    child: Center(
                                      child: Text(
                                        'Stock:-${widget.productInformation.itemcount}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      )
                    : index == 1
                    ? CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingMd),
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: AppSize.spacingSm,
                          bottom: AppSize.spacingSm,
                        ),
                        radius: 0,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                        boxShadow: BoxShadow(offset: Offset(0.1, 0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppTextFile.Description,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text("${fulldata.description}"),
                          ],
                        ),
                      )
                    : index == 2
                    ? CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingMd),
                        width: double.infinity,
                        radius: 0,
                        margin: EdgeInsets.only(bottom: AppSize.spacingSm),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                        boxShadow: BoxShadow(offset: Offset(0.1, 0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppTextFile.ProductDetails,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                Text("${AppTextFile.Weight} :"),
                                SizedBox(width: 10),
                                Text("343g"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("${AppTextFile.Category} :"),
                                SizedBox(width: 10),
                                Text(AppTextFile.electronices),
                              ],
                            ),
                          ],
                        ),
                      )
                    : CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingMd),
                        width: double.infinity,
                        radius: 0,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                        boxShadow: BoxShadow(offset: Offset(0.1, 0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppTextFile.ProductDetails,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => CommonContainer(
                                  height: Screensize.height(context) * 0.04,
                                  width: Screensize.weight(context) * 0.2,
                                  color: Colors.blue.shade100,
                                  margin: EdgeInsets.only(
                                    right: AppSize.spacingSm,
                                  ),
                                  child: Center(child: Text("Fitness")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
            SizedBox(height: AppSize.spacingLg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  OnPressed: () {},
                  widht: 160,
                  radius: 6,
                  child: Row(
                    children: [
                      Icon(Commonicon.shereicon, size: AppSize.IconLG),
                      SizedBox(width: AppSize.spacingXs),
                      Text(AppTextFile.Share),
                    ],
                  ),
                ),
                SizedBox(width: AppSize.spacingXxxl),
                CommonButton(
                  OnPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Producteditscreen(),
                      ),
                    );
                  },
                  radius: 6,
                  widht: 160,
                  child: Row(
                    children: [
                      Icon(Commonicon.Edit, size: AppSize.IconLG),
                      SizedBox(width: AppSize.spacingXs),
                      Text(AppTextFile.EditButton),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.spacingXxl),
          ],
        ),
      ),
    );
  }
}
