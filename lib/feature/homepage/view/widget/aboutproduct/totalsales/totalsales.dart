import 'package:flutter/material.dart';

import '../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../core/commonfile/screensize.dart';
import '../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../core/commonwidget/commonappbar.dart';
import '../../../../../../core/commonwidget/commoncontainer.dart';

class TotalSales extends StatelessWidget {
  const TotalSales({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CommonAppBar(
          showBack: true,
          title: "Sales History",
          iconOne: Commonicon.notification,
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return Container(
                  padding: EdgeInsets.all(AppSize.paddingMd),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: Screensize.height(context) * 0.14,
                  width: Screensize.weight(context) * 0.42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: index == 0
                          ? [
                              AppColor.primary,
                              AppColor.primary.withOpacity(0.7),
                            ]
                          : [Colors.deepPurple, Colors.deepPurpleAccent],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Commonicon.moneyicon, color: Colors.white, size: 28),
                      Spacer(),
                      Text(
                        "Total Sales",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                      ),
                      Text(
                        "₹5,994",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.paddingSm,
                right: AppSize.paddingSm,
              ),
              child: CommonContainer(
                color: Colors.white,
                child: SizedBox(
                  height: Screensize.height(context) * 0.06,
                  child: TabBar(
                    padding: EdgeInsets.all(5),
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: "Today"),
                      Tab(text: "Week"),
                      Tab(text: "Month"),
                      Tab(text: "Custom"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.paddingMd,
                  right: AppSize.paddingMd,
                  top: 5,
                ),
                child: TabBarView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          "Sales Transactions",
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// product + price
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Wireless Bluetooth Earbuds Pro",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.primary,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 6),

                                        Text(
                                          "Rahul Sharma",
                                          style: TextStyle(color: Colors.grey),
                                        ),

                                        SizedBox(height: 10),

                                        Row(
                                          children: [
                                            Icon(
                                              Commonicon.CalenderIcon,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "10 Dec 2025",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Text("Profit: "),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          "Sales Transactions",
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 7),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// product + price
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Wireless Bluetooth Earbuds Pro",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.primary,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 6),

                                        Text(
                                          "Rahul Sharma",
                                          style: TextStyle(color: Colors.grey),
                                        ),

                                        SizedBox(height: 10),

                                        Row(
                                          children: [
                                            Icon(
                                              Commonicon.CalenderIcon,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "10 Dec 2025",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Text("Profit: "),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          "Sales Transactions",
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 7),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// product + price
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Wireless Bluetooth Earbuds Pro",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.primary,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 6),

                                        Text(
                                          "Rahul Sharma",
                                          style: TextStyle(color: Colors.grey),
                                        ),

                                        SizedBox(height: 10),

                                        Row(
                                          children: [
                                            Icon(
                                              Commonicon.CalenderIcon,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "10 Dec 2025",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Text("Profit: "),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          "Sales Transactions",
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 7),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// product + price
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Wireless Bluetooth Earbuds Pro",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.primary,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Rahul Sharma",
                                          style: TextStyle(color: Colors.grey),
                                        ),

                                        SizedBox(height: 10),

                                        Row(
                                          children: [
                                            Icon(
                                              Commonicon.CalenderIcon,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "10 Dec 2025",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Text("Profit: "),
                                            Text(
                                              "₹2598",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
