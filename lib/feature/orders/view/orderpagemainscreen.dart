import 'package:flutter/material.dart';
import 'package:reselling_new/feature/orders/view/widget/cancelled.dart';
import 'package:reselling_new/feature/orders/view/widget/delivered.dart';
import 'package:reselling_new/feature/orders/view/widget/neworder.dart';
import 'package:reselling_new/feature/orders/view/widget/outofdelivery.dart';
import 'package:reselling_new/feature/orders/view/widget/packed.dart';
import 'package:reselling_new/feature/orders/view/widget/shipped.dart';

import '../../../core/commonfile/shimmereffact.dart';
import '../../../core/commonwidget/commonappbar.dart';
import '../../../core/commonwidget/commontabbar.dart';
import '../../../repo/orderrapo.dart';
import '../../homepage/hometextfile.dart';

class OrderPageMainScreen extends StatefulWidget {
  final bool isactiveorder;
  OrderPageMainScreen({super.key, required this.isactiveorder});
  @override
  State<OrderPageMainScreen> createState() => _OrderPageMainScreenState();
}

class _OrderPageMainScreenState extends State<OrderPageMainScreen> {
  final orders = OrderRepository.getOrders();
  bool isLoading = false;
  @override
  void didUpdateWidget(OrderPageMainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isactiveorder && !oldWidget.isactiveorder) {
      startLoadingorder();
    }
  }

  void startLoadingorder() {
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
      startLoadingorder();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: false, title: "Orders"),
      body: isLoading
          ? shimmerItem()
          : CommonTabBar(
              tabs: [
                AppTextFile.Neworder,
                AppTextFile.Packed,
                AppTextFile.Shipped,
                AppTextFile.OutofDelivery,
                AppTextFile.Delivered,
                AppTextFile.Cancelled,
              ],
              views: [
                NewOrder(),
                Pack(),
                Shipped(),
                Outofdelivery(),
                Delivered(),
                Cancelled(),
              ],
            ),
    );
  }
}
