import 'package:flutter/material.dart';
import 'package:reselling_new/core/commonfile/screensize.dart';
import 'package:reselling_new/core/commonstyle/sizes.dart';
import 'package:reselling_new/core/commonwidget/commonappbar.dart';
import 'package:reselling_new/core/commonwidget/commoncontainer.dart';
import 'package:reselling_new/feature/profile/view/widget/settingspage/widget/help&support/texticonfilehelp.dart';

class HelpNdSupport extends StatefulWidget {
  const HelpNdSupport({super.key});
  @override
  State<HelpNdSupport> createState() => _HelpNdSupportState();
}

class _HelpNdSupportState extends State<HelpNdSupport> {
  int selectedIndex = -1;
  final List faq = [
    {
      "question": "How do I add a new product?",
      "answer":
          "Navigate to Products > Add Product, fill in the product details including name, category, price, and stock quantity, then tap Save.",
    },
    {
      "question": "How can I track my orders?",
      "answer": "You can track orders from the Orders section.",
    },
    {
      "question": "How do I add a delivery partner?",
      "answer": "Go to Delivery Partner section and add details.",
    },
    {
      "question": "When will I receive my payouts?",
      "answer": "Payouts are processed weekly.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: "Help&Support"),
      body: Column(
        children: [
          CommonContainer(
            height: Screensize.height(context) * 0.25,
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.all(AppSize.paddingSm),
            radius: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quick Actions",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CommonContainer(
                                height: Screensize.height(context) * 0.045,
                                width: Screensize.weight(context) * 0.096,
                                color: Colors.blue.shade100,
                                radius: 50,
                                child: Icon(
                                  Texticonfilehelp.fileicon[index]['icons'],
                                  size: 28,
                                ),
                              ),
                              SizedBox(
                                width: Screensize.weight(context) * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Texticonfilehelp.fileicon[index]['type'],
                                  ),
                                  Text(
                                    Texticonfilehelp.fileicon[index]['contact'],
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined, size: 22),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: Screensize.height(context) * 0.02),
          CommonContainer(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.all(AppSize.paddingSm),
            radius: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Frequently Asked Question",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: faq.length,
                  itemBuilder: (context, index) {
                    bool isOpen = selectedIndex == index;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = isOpen ? -1 : index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    faq[index]["question"],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (isOpen)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                            child: Text(
                              faq[index]["answer"],
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                        if (index != faq.length - 1)
                          Divider(height: 1, color: Colors.grey.shade300),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: Screensize.height(context) * 0.02),
          CommonContainer(
            padding: EdgeInsets.all(AppSize.paddingSm),
            width: double.infinity,
            radius: 0,
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Support Hours",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Monday-Friday: 9:00AM - 8.00PM",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.blue),
                ),
                Text(
                  "Saturday:10:00AM - 6:00PM",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.blue),
                ),
                Text(
                  "Sunday:Closed",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
