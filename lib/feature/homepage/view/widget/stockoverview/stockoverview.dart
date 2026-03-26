import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/stockfulldatascreen.dart';

import '../../../../../core/commonfile/screensize.dart';
import '../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../core/commonstyle/sizes.dart';
import '../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../core/commonwidget/commontextbutton.dart';
import '../../../homelistfile.dart';
import '../../../hometextfile.dart';
import '../../../viewmodel/datauplodeprovider.dart';

class StockOverview extends StatelessWidget {
  const StockOverview({super.key});
  static const List<Color> lightBgColors = [
    Color(0xFFE6D9FF),
    Color(0xFFD6E6FF),
    Color(0xFFD9F2E6),
    Color(0xFFFFE2CC),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      padding: EdgeInsets.only(
        left: AppSize.paddingMd,
        right: AppSize.paddingMd,
      ),
      height: Screensize.height(context) * 0.30,
      width: Screensize.weight(context) * double.infinity,
      color: Colors.white,
      radius: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Stock Overview",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              CommonTextButton(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Stockfulldatascreen(),
                    ),
                  );
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w600,
                    fontFamily: "poppins",
                  ),
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final provider = context.watch<Datauplodeprovider>();
              final products = provider.getProductModels();
              int outOfStock = products.where((e) => e.itemcount == 0).length;
              int lowStock = products
                  .where((e) => e.itemcount > 0 && e.itemcount <= 10)
                  .length;
              int inStock = products.where((e) => e.itemcount > 5).length;
              int locked = products.where((e) => e.isLock == true).length;
              return CommonContainer(
                padding: EdgeInsets.all(AppSize.paddingMd),
                color: lightBgColors[index % lightBgColors.length],
                radius: 10,
                boxShadow: BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index <= 1
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Homelistfile.StockSection[index]["Icon"],
                              color: homeiconcolor.iconscolor[index],
                              size: 19,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              Homelistfile.StockSection[index]["Image"],
                              height: 19,
                              width: 19,
                            ),
                          ),
                    const SizedBox(width: AppSize.spacingMd),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Homelistfile.StockSection[index]["title"],
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Builder(
                          builder: (context) {
                            String value = "";
                            if (index == 0) {
                              value = inStock.toString();
                            } else if (index == 1) {
                              value = lowStock.toString();
                            } else if (index == 2) {
                              value = outOfStock.toString();
                            } else {
                              value = locked.toString();
                            }

                            return Text(
                              value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
