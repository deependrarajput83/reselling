import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/aboutproduct/totalearning/totalearningmainscreen.dart';
import 'package:reselling_new/feature/homepage/view/widget/aboutproduct/totalsales/totalsales.dart';

import '../../../../../core/commonfile/screensize.dart';
import '../../../../../core/commonstyle/sizes.dart';
import '../../../../../core/commonwidget/commoncontainer.dart';
import '../../../homelistfile.dart';
import '../../../hometextfile.dart';

class AboutProduct extends StatelessWidget {
  const AboutProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screensize.height(context) * 0.31,
      child: GridView.builder(
        padding: EdgeInsets.all(AppSize.paddingSm),
        itemCount: 4,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: 7,
          mainAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              index == 1
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TotalSales()),
                    )
                  : index == 2
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalEarningMainScreen(),
                      ),
                    )
                  : Text("Something went wrong");
            },
            child: CommonContainer(
              color: Colors.white,
              radius: 14,
              padding: EdgeInsets.all(AppSize.paddingSm),
              boxShadow: BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 18,
                spreadRadius: -3,
                offset: const Offset(0, 6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      index <= 1
                          ? Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: homeiconcolor.iconscolor[index]
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Homelistfile.TopSection[index]["Icon"],
                                color: homeiconcolor.iconscolor[index],
                                size: 20,
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                Homelistfile.TopSection[index]["Image"],
                                height: 20,
                                width: 20,
                              ),
                            ),
                      Spacer(),
                      index % 5 == 3
                          ? Text("")
                          : Text(
                              "+24%",
                              style: TextStyle(
                                fontFamily: "poppins",
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(height: AppSize.spacingMd),
                  Text(
                    Homelistfile.TopSection[index]["title"],
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(fontSize: 15),
                  ),
                  index == 2
                      ? Text(
                          "₹299999",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(fontSize: 15),
                        )
                      : Text(
                          "250",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(fontSize: 15),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
