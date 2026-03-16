import 'package:flutter/material.dart';

import '../../core/commonfile/screensize.dart';
import '../../core/commonstyle/colorstyle.dart';
import '../../core/commonstyle/sizes.dart';
import '../../core/commonwidget/commoncontainer.dart';

class NotificationClass extends StatelessWidget {
  final int? Itemcount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const NotificationClass({
    super.key,
    this.Itemcount,
    required this.itemBuilder,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Itemcount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: AppSize.paddingMd,
            right: AppSize.paddingMd,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonContainer(
                height: Screensize.height(context) * 0.14,
                width: Screensize.weight(context) * double.infinity,
                padding: EdgeInsets.all(AppSize.paddingMd),
                border: Border.all(color: AppColor.primary, width: 0.1),
                color: Colors.white,
                child: itemBuilder(context, index),
              ),
            ],
          ),
        );
      },
    );
  }
}
