import 'package:flutter/material.dart';

import '../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../homelistfile.dart';
import '../../../../../hometextfile.dart';

class AllInfo extends StatelessWidget {
  const AllInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screensize.height(context) * 0.31,
      child: GridView.builder(
        itemCount: 4,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 7,
          mainAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return CommonContainer(
            color: Colors.white,
            padding: EdgeInsets.all(AppSize.paddingMd),
            boxShadow: BoxShadow(
              color: Color(0xFF7B2FF7).withOpacity(0.25),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Homelistfile.TEarnings[index]["Icon"],
                  color: homeiconcolor.iconscolor[index],
                  size: 22,
                ),
                SizedBox(height: AppSize.spacingMd),
                Text(
                  Homelistfile.TEarnings[index]["title"],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                index == 0
                    ? Text(
                        "₹299999",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    : index == 1
                    ? Text(
                        "1542",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    : index == 2
                    ? Text(
                        "₹2076",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    : Text(
                        "₹12k",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
