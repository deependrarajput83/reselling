import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reselling_new/core/commonfile/screensize.dart';
import 'package:reselling_new/core/commonstyle/colorstyle.dart';
import 'package:reselling_new/core/commonstyle/sizes.dart';
import 'package:reselling_new/core/commonwidget/commonappbar.dart';
import 'package:reselling_new/core/commonwidget/commoncontainer.dart';

import '../../../../core/commonwidget/commonbutton.dart';
import '../../viewmodel/orderdata.dart';
import '../../viewmodel/orderdataprovider.dart';

class Detailsscreen extends StatefulWidget {
  final OrderModel data;
  Detailsscreen({super.key, required this.data});
  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  final List<String> titles = [
    "Order Received",
    "Packed",
    "Shipped",
    "Out for Delivery",
    "Delivered",
  ];
  final List<String> status = ["Completed", "Completed", "In Progress", "", ""];
  late final datalist = widget.data;
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Orderdataprovider>();
    int currentStep = provider.getStepFromStatus(widget.data.status.toString());
    return Scaffold(
      appBar: const CommonAppBar(showBack: true, title: "Order Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonContainer(
              radius: 0,
              color: AppColor.ContainerColor,
              child: Padding(
                padding: const EdgeInsets.all(AppSize.paddingSm),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Order Summary",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Text(
                          widget.data.orderId,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                    SizedBox(height: Screensize.height(context) * 0.005),
                    Row(
                      children: [
                        Text(
                          "Order Date",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Spacer(),
                        Text(
                          "${datalist.orderdate}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: Screensize.height(context) * 0.005),
                    Row(
                      children: [
                        Text(
                          "Payment Type",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Spacer(),
                        CommonContainer(
                          height: Screensize.height(context) * 0.024,
                          width: Screensize.weight(context) * 0.15,
                          radius: 4,
                          color: AppColor.secondary,
                          child: Center(
                            child: Text(
                              "${datalist.paymenttype}",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: AppColor.whitebutton,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Screensize.height(context) * 0.005),
                    Row(
                      children: [
                        Text(
                          "Total Amount",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Spacer(),
                        Text(
                          "\u20B9${datalist.price}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Screensize.height(context) * 0.014),
            CommonContainer(
              width: double.infinity,
              color: AppColor.ContainerColor,
              child: Padding(
                padding: const EdgeInsets.all(AppSize.paddingSm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Details",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.person, size: 18, color: Colors.grey),
                        SizedBox(width: Screensize.weight(context) * 0.009),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Customer Name",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey, fontSize: 14),
                            ),
                            Text("${datalist.name}"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Screensize.height(context) * 0.009),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: Screensize.weight(context) * 0.009),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Address",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey, fontSize: 14),
                            ),
                            Text("${datalist.address}"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Screensize.height(context) * 0.009),
            CommonContainer(
              width: double.infinity,
              color: AppColor.ContainerColor,
              padding: const EdgeInsets.all(AppSize.paddingSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Items", style: Theme.of(context).textTheme.titleMedium),
                  Row(
                    children: [
                      Text(
                        datalist.product,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        "\u20B9${datalist.price}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Text(
                    "Quantity:2",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: Screensize.height(context) * 0.02),
            CommonContainer(
              width: double.infinity,
              color: AppColor.ContainerColor,
              padding: const EdgeInsets.all(AppSize.paddingSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Status",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return IntrinsicHeight(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: index < currentStep
                                        ? Colors.green
                                        : Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                if (index != titles.length - 1)
                                  Expanded(
                                    child: Container(
                                      width: 2,
                                      color: index <= currentStep
                                          ? Colors.green
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: index <= currentStep
                                          ? Colors.black
                                          : Colors.green,
                                    ),
                                  ),
                                  if (status[index].isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 16,
                                        top: 4,
                                      ),
                                      child: Text(
                                        index < currentStep
                                            ? "Completed"
                                            : index == currentStep
                                            ? "In Progress"
                                            : "",
                                        style: TextStyle(
                                          color: index == 2
                                              ? Colors.orange
                                              : Colors.green,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  else
                                    const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingSm),
              child: Column(
                children: [
                  CommonButton(
                    widht: double.infinity,
                    OnPressed: () {
                      context.read<Orderdataprovider>().updateNextStatus(
                        widget.data,
                      );
                    },
                    child: Text("Update to Next Status"),
                  ),
                  SizedBox(height: Screensize.height(context) * 0.01),
                  Row(
                    children: [
                      CommonButton(
                        OnPressed: () {},
                        child: Text("Assign Delivery"),
                      ),
                      const Spacer(),
                      CommonButton(OnPressed: () {}, child: Text("Invoice")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
