import 'package:flutter/material.dart';
import 'package:reselling_new/feature/homepage/view/widget/aboutproduct/aboutproductmainscreen.dart';
import 'package:reselling_new/feature/homepage/view/widget/notificationscreen.dart';
import 'package:reselling_new/feature/homepage/view/widget/quickaction/quickaction.dart';
import 'package:reselling_new/feature/homepage/view/widget/stockoverview/stockoverview.dart';
import 'package:reselling_new/feature/homepage/view/widget/weeklysaleschart.dart';

import '../../../core/commonfile/shimmereffact.dart';
import '../../../core/commonstyle/sizes.dart';
import '../../../core/commonwidget/commonappbar.dart';

class HomeMainPage extends StatefulWidget {
  final bool isActive;
  const HomeMainPage({super.key, required this.isActive});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  bool isLoading = false;
  @override
  void didUpdateWidget(HomeMainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      startLoading();
    }
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      startLoading();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Dashboard",
        //iconOne: Commonicon.notification,
        imagepicker: "image/svgicon/notificationicon.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          );
        },
        showCircle: true,
        showBack: false,
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? shimmerItem()
            : Column(
                children: [
                  AboutProduct(),
                  StockOverview(),
                  SizedBox(height: AppSize.spacingMd),
                  WeeklySalesChart(),
                  SizedBox(height: AppSize.spacingMd),
                  QuickActionMainPage(),
                  SizedBox(height: 90),
                ],
              ),
      ),
    );
  }
}
