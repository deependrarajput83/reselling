import 'package:flutter/material.dart';
import 'package:reselling_new/feature/orders/view/orderpagemainscreen.dart';

import '../../../../../core/commonfile/screensize.dart';
import '../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../core/commonstyle/sizes.dart';
import '../../../../../core/commonwidget/commoncontainer.dart';
import '../../../homelistfile.dart';
import 'addproduct/addproduct.dart';

class QuickActionMainPage extends StatelessWidget {
  const QuickActionMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    const List<Color> lightBgColors = [
      Color(0xFFE6D9FF),
      Color(0xFFD6E6FF),
      Color(0xFFD9F2E6),
    ];
    const List<Color> icondarkColors = [
      AppColor.primary,
      AppColor.secondary,
      AppColor.redcolor,
    ];
    return CommonContainer(
      color: Colors.white,
      height: Screensize.height(context) * 0.16,
      width: Screensize.weight(context) * double.infinity,
      padding: EdgeInsets.only(
        left: AppSize.paddingMd,
        right: AppSize.paddingMd,
        top: 10,
      ),
      radius: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: AppSize.spacingSm),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColor.primary.withOpacity(0.15),
                  highlightColor: AppColor.primary.withOpacity(0.05),
                  hoverColor: Colors.red,
                  onTap: () async {
                    if (index == 0) {
                      await Future.delayed(Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddProduct()),
                        );
                      });
                    }
                    if (index == 1) {
                      await Future.delayed(Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderPageMainScreen(isactiveorder: true),
                          ),
                        );
                      });
                    }
                  },
                  child: CommonContainer(
                    color: lightBgColors[index % lightBgColors.length],
                    radius: 14,
                    boxShadow: BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: index == 1
                              ? Icon(
                                  Homelistfile.AppQuick[index]["Icon"],
                                  size: 18,
                                  color: icondarkColors[index],
                                )
                              : Image.asset(
                                  Homelistfile.AppQuick[index]["Image"],
                                  height: 18,
                                  width: 18,
                                ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          Homelistfile.AppQuick[index]["title"],
                          maxLines: 1,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
