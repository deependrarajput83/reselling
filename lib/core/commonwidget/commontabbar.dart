import 'package:flutter/material.dart';

import '../commonfile/screensize.dart';
import '../commonstyle/colorstyle.dart';
import 'commoncontainer.dart';

class CommonTabBar extends StatelessWidget {
  //final int length;
  final List<String> tabs;
  final List<Widget> views;
  final double? height;
  final Color? ConColor;
  final BoxBorder? Borders;
  final TabController? controller;
  const CommonTabBar({
    super.key,
    // required this.length,
    required this.tabs,
    required this.views,
    this.height = 48,
    this.ConColor,
    this.Borders,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          CommonContainer(
            color: ConColor,
            height: height,
            radius: 0,
            border: Borders,
            child: TabBar(
              padding: EdgeInsets.all(5),
              automaticIndicatorColorAdjustment: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.black,
              indicatorWeight: double.minPositive,
              labelPadding: EdgeInsets.only(left: 5, right: 5),
              controller: controller,
              isScrollable: true,
              labelColor: Colors.white,
              labelStyle: Theme.of(context).textTheme.labelSmall,
              indicator: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              tabs: tabs.map((e) {
                return CommonContainer(
                  height: Screensize.height(context) * 0.25,
                  width: Screensize.weight(context) * 0.25,
                  border: Border.all(color: AppColor.primary),
                  child: Center(child: Text(e)),
                );
              }).toList(),
            ),
          ),
          Expanded(child: TabBarView(children: views)),
        ],
      ),
    );
  }
}
