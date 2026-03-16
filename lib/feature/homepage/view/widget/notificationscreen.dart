import 'package:flutter/material.dart';

import '../../../../core/commonfile/commonicon.dart';
import '../../../../core/commonfile/screensize.dart';
import '../../../../core/commonwidget/commonappbar.dart';
import '../../../../core/commonwidget/commoncontainer.dart';
import '../../../notification/notificationclass.dart';

class NotificationScreen extends StatelessWidget {
  List<IconData> icons = [
    Commonicon.itemicon,
    Commonicon.lowstock,
    Commonicon.moneyicon,
    Commonicon.CarIcon,
  ];
  static const List<Color> lightBgColors = [
    Color(0xFFE6D9FF),
    Color(0xFFD6E6FF),
    Color(0xFFD9F2E6),
    Color(0xFFFFE2CC),
  ];
  NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: "Notification"),
      body: NotificationClass(
        Itemcount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonContainer(
                height: Screensize.height(context) * 0.09,
                width: Screensize.weight(context) * 0.2,
                color: lightBgColors[index],
                child: Icon(icons[index]),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New Order Received",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "order #ORD-1001 from Rahul Singh",
                                maxLines: 1,
                                softWrap: true,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("2 min ago"),
                            ],
                          )
                        : index == 1
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Low stock Alert",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "Smart Fitness Watch has only 8 items left",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 13),
                              ),
                              Text("20 min ago"),
                            ],
                          )
                        : index == 2
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Received",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "Payment of ₹2000",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 13),
                              ),
                              Text("3 Hours ago"),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Delivered",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "order #ORD-1004 has been delivered successfully",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 13),
                              ),
                              Text("5 hours ago"),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
