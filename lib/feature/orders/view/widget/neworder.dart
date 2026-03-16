import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/core/commonfile/app.dart';

import '../../viewmodel/orderdataprovider.dart';

class NewOrder extends StatefulWidget {
  //final List<OrderModel> orders;
  NewOrder({super.key});
  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<Orderdataprovider>().loadOrders();
    });
  }

  int? loadingOrderId;
  String? loadingAction;
  void button(order) {
    setState(() {
      loadingOrderId = order.id;
      loadingAction = "accept";
    });
    Future.delayed(Duration(seconds: 2), () {
      context.read<Orderdataprovider>().acceptOrder(order);
      setState(() {
        loadingOrderId = null;
        loadingAction = null;
      });
    });
  }

  void remove(order) {
    setState(() {
      loadingOrderId = order.id;
      loadingAction = "reject";
    });
    Future.delayed(Duration(seconds: 2), () {
      context.read<Orderdataprovider>().Rejectorder(order);
      setState(() {
        loadingOrderId = null;
        loadingAction = null;
      });
    });
  }

  Widget build(BuildContext context) {
    final orders = context.watch<Orderdataprovider>().newOrders;
    if (orders.isEmpty) {
      return const Center(
        child: Text(
          "No active orders",
          style: TextStyle(fontFamily: 'poppins'),
        ),
      );
    }
    return Stack(
      children: [
        ListView.builder(
          itemCount: orders.length,
          padding: EdgeInsets.all(AppSize.paddingSm),
          itemBuilder: (context, index) {
            final order = orders[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSize.paddingSm),
              child: CommonContainer(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(AppSize.paddingSm),
                radius: 10,
                //height: Screensize.height(context) * 0.16,
                width: double.infinity,
                boxShadow: BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
                color: AppColor.Whitecolor,
                child: Row(
                  children: [
                    SizedBox(
                      height: 85,
                      width: 85,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CommonimagePicker(
                          imagepath: order.image,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order.orderId,
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(color: Colors.blue),
                                ),
                                Text(
                                  "₹${order.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              order.name,
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(fontSize: 14),
                            ),
                            Text(
                              order.product,
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    background: AppColor.secondary,
                                    OnPressed: () => button(order),
                                    height: 35,
                                    radius: 8,
                                    child: const Text("Accept"),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CommonButton(
                                    background: AppColor.redcolor,
                                    OnPressed: () => remove(order),
                                    height: 35,
                                    radius: 8,
                                    child: const Text("Reject"),
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
          },
        ),
        if (loadingOrderId != null)
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (loadingOrderId != null)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
      ],
    );
  }
}
